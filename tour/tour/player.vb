Imports Microsoft.VisualBasic

Public Class Player

    Public name As String
    Public code As String
    Public strength As Integer

    Public Sub New(c As String, s As Integer)
        code = c
        strength = s
    End Sub
End Class

Public Class Team
    Public p1 As Player
    Public p2 As Player

    Public Sub New(ByRef a As Player, ByRef b As Player)
        If a.strength >= b.strength Then
            p1 = a
            p2 = b
        Else
            p1 = b
            p2 = a
        End If
    End Sub

    Public ReadOnly Property combinedStrength
        Get
            Return (p1.strength + p2.strength) * 0.5
        End Get
    End Property

End Class
