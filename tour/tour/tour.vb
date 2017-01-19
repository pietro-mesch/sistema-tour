Module tour

    Sub Main()
        Dim m As Integer = 100
        Dim match As Match

        Dim r As New Roster(10)

        For i As Integer = 1 To m
            match = r.RandomMatch
            match.simulateResult()
            r.updateRanking(match)
        Next
    End Sub

End Module
