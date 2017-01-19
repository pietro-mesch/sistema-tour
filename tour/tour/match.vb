Imports Microsoft.VisualBasic

Public Class Match
    Private A As Team
    Private B As Team
    'TODO SET BACK TO PRIVATE
    Public ea As Integer
    Public eb As Integer

    Private ra As Integer
    Private rb As Integer
    Private status As e_MatchStatus
    'these shall not exist
    Private sa As Integer
    Private sb As Integer

    Public Sub New(ByRef teamA As Team, ByRef teamB As Team)
        A = teamA
        B = teamB
        status = e_MatchStatus.scheduled
    End Sub

#Region "ENUMS"
    Private Enum e_MatchStatus
        scheduled
        finished
        recorded
    End Enum
#End Region

#Region "PROPERTIES"
    Public ReadOnly Property expected_A As Double
        Get
            Return ea / (ea + eb)
        End Get
    End Property
    Public ReadOnly Property expected_B As Double
        Get
            Return eb / (ea + eb)
        End Get
    End Property
    Public ReadOnly Property finalscore_A As Double
        Get
            Return ra / (ra + rb)
        End Get
    End Property
    Public ReadOnly Property finalscore_B As Double
        Get
            Return rb / (ra + rb)
        End Get
    End Property
    Public ReadOnly Property team_A As Team
        Get
            Return A
        End Get
    End Property
    Public ReadOnly Property team_B As Team
        Get
            Return B
        End Get
    End Property
    Public ReadOnly Property isFinished As Boolean
        Get
            Return status = e_MatchStatus.finished
        End Get
    End Property
#End Region

#Region "PUBLIC METHODS"

    Public Sub calculateExpectedResult(ByVal rankA As Double, ByVal rankB As Double)
        'team expected score
        Dim qa = 10 ^ (0.5 * rankA / Roster.DELTA75)
        Dim qb = 10 ^ (0.5 * rankB / Roster.DELTA75)

        If qa > qb Then
            ea = Roster.WIN_GOALS
            eb = Math.Min(Math.Round(ea * qb / qa), Roster.WIN_GOALS - 1)
        ElseIf qa < qb Then
            eb = Roster.WIN_GOALS
            ea = Math.Min(Math.Round(eb * qa / qb), Roster.WIN_GOALS - 1)
        Else
            ea = Roster.WIN_GOALS - 1
            eb = Roster.WIN_GOALS - 1
        End If

    End Sub

    Public Sub simulateResult()
        'team expected score
        Dim qa = 10 ^ (0.5 * A.combinedStrength / Roster.DELTA75)
        Dim qb = 10 ^ (0.5 * B.combinedStrength / Roster.DELTA75)

        If qa > qb Then
            ra = Roster.WIN_GOALS
            rb = Math.Min(Math.Round(ra * qb / qa), Roster.WIN_GOALS - 1)
        ElseIf qa < qb Then
            rb = Roster.WIN_GOALS
            ra = Math.Min(Math.Round(rb * qa / qb), Roster.WIN_GOALS - 1)
        Else
            ra = Roster.WIN_GOALS - 1
            rb = Roster.WIN_GOALS - 1
        End If

        'NO VARIANCE FOR NOW

        If ra = rb Then
            Dim r As New Random
            If r.Next(1) = 0 Then
                ra += 1
            Else
                rb += 1
            End If
        End If

        close()

    End Sub

#End Region

#Region "PRIVATE METHODS"
    Private Sub close()
        status = e_MatchStatus.finished

        Console.WriteLine(String.Format("    ended    {0} : {1}    ({2} v {3})", ra, rb, A.combinedStrength, B.combinedStrength))

    End Sub
#End Region
End Class
