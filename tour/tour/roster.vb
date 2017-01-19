Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.Strings

Public Class Roster

    Public Const WIN_GOALS = 6
    Public Const DELTA75 = 200

    Private Const INIT_SCORE = 0
    Private Const MAX_POT = 50
    Private Const TEAM_MODE = e_teamDistributionMode.Proportional

    Private ranking As New Dictionary(Of Player, Double)
    Private players As New List(Of Player)
    Private playerCount As Integer = 0


    Public standings() As String

    Public Sub New(ByVal n As Integer)
        If n < 4 Then n = 4

        Dim s As New Random

        For i As Integer = 1 To n
            playerCount += 1
            players.Add(New Player(New String({Chr(s.Next(65, 91)), Chr(s.Next(65, 91)), Chr(s.Next(65, 91))}), s.Next(200, 501)))
            ranking.Add(players(playerCount - 1), INIT_SCORE)
        Next

    End Sub

#Region "ENUMS"
    Private Enum e_teamDistributionMode
        Equal
        Proportional
    End Enum
#End Region
#Region "PUBLIC PROPERTIES"

#End Region


#Region "PUBLIC METHODS"

    Public Function RandomMatch() As Match
        Dim s As New Random

        Dim p As New HashSet(Of Player)

        'GET FOUR RANDOM PLAYERS
        Do
            p.Add(players(s.Next(playerCount)))
        Loop Until p.Count = 4
        Dim A As New Team(p(0), p(1))
        Dim B As New Team(p(2), p(3))

        Return ScheduleMatch(A, B)

    End Function

    Private Function ScheduleMatch(ByRef A As Team, ByRef B As Team) As Match

        Dim m As New Match(A, B)
        Dim rankA, rankB As Double

        rankA = CalculateTeamRanking(A)
        rankB = CalculateTeamRanking(B)

        m.calculateExpectedResult(rankA, rankB)

        Console.Write(String.Format("{0}+{1} vs {2}+{3}    ({6} vs {7})    {4} : {5}", A.p1.code, A.p2.code, B.p1.code, B.p2.code, m.ea, m.eb, rankA, rankB))

        Return m
    End Function

    Public Sub updateRanking(m As Match)
        Try
            If Not m.isFinished Then
                Throw New Exception("Cannot update ranking based on unfinished or already recorded match.")
            End If

            UpdateTeamRanking(m)

            UpdateStandings()

        Catch ex As Exception
            Exit Sub
        End Try
    End Sub

#End Region

#Region "PRIVATE METHODS"

    Private Function CalculateTeamRanking(ByRef t As Team) As Double
        'just the average
        Return (ranking(t.p1) + ranking(t.p2)) * 0.5
    End Function

    Private Sub UpdateTeamRanking(m As Match, Optional k As Double = MAX_POT)

        Dim team_delta As Double

        Select Case TEAM_MODE
            Case e_teamDistributionMode.Equal
                'TEAM A
                team_delta = k * (m.finalscore_A - m.expected_A)

                ranking(m.team_A.p1) = Math.Round(Math.Max(ranking(m.team_A.p1) + team_delta, 0))
                ranking(m.team_A.p2) = Math.Round(Math.Max(ranking(m.team_A.p2) + team_delta, 0))

                'TEAM B
                team_delta = k * (m.finalscore_B - m.expected_B)

                ranking(m.team_B.p1) = Math.Round(Math.Max(ranking(m.team_B.p1) + team_delta, 0))
                ranking(m.team_B.p2) = Math.Round(Math.Max(ranking(m.team_B.p2) + team_delta, 0))

            Case e_teamDistributionMode.Proportional
                team_delta = k * (m.finalscore_A - m.expected_A)

                Dim q1 As Double
                Dim q2 As Double

                If ranking(m.team_A.p1) = ranking(m.team_A.p2) Then
                    q1 = 0.5
                    q2 = 0.5
                Else
                    q1 = 0.5 + 0.5 * ranking(m.team_A.p1) / (ranking(m.team_A.p1) + ranking(m.team_A.p2))
                    q2 = 0.5 + 0.5 * ranking(m.team_A.p2) / (ranking(m.team_A.p1) + ranking(m.team_A.p2))
                End If

                ranking(m.team_A.p1) = Math.Round(Math.Max(ranking(m.team_A.p1) + team_delta, 0))
                ranking(m.team_A.p2) = Math.Round(Math.Max(ranking(m.team_A.p2) + team_delta, 0))

                'TEAM B
                team_delta = k * (m.finalscore_B - m.expected_B)

                If ranking(m.team_B.p1) = ranking(m.team_B.p2) Then
                    q1 = 0.5
                    q2 = 0.5
                Else
                    q1 = 0.5 + 0.5 * ranking(m.team_B.p1) / (ranking(m.team_B.p1) + ranking(m.team_B.p2))
                    q2 = 0.5 + 0.5 * ranking(m.team_B.p2) / (ranking(m.team_B.p1) + ranking(m.team_B.p2))
                End If

                ranking(m.team_B.p1) = Math.Round(Math.Max(ranking(m.team_B.p1) + team_delta, 0))
                ranking(m.team_B.p2) = Math.Round(Math.Max(ranking(m.team_B.p2) + team_delta, 0))
        End Select
    End Sub

    Private Sub UpdateStandings()
        ReDim standings(playerCount - 1)

        Dim heap As New BinaryHeap
        Dim p As Player
        For i As Integer = 0 To playerCount - 1
            heap.Enqueue(i, -ranking(players(i)))
        Next

        For i As Integer = 0 To playerCount - 1
            p = players(heap.Dequeue())
            standings(i) = String.Format("{2}    R {1}    S {0}", p.strength, ranking(p), p.code)
        Next
    End Sub

#End Region
End Class
