' created by Akira | abillionshiningstars on the day before this was due

' I write this program under the presumption that
' 1. This is under Form 1 dot VB or whereever the main program usually is in a program like so.
' 2. imlElsaRight contains Elsa walking east 0-8.bmp
' 3. imlElsaLeft contains Elsa walking west 0-8.bmp
' I have NO IDEA what Thumbs.db is for, sorry

Class Form1
    Dim objBackground As Graphics 
    Dim X As Integer = 10, Y As Integer = 80 
    Private Sub Form1_Paint(ByVal sender As Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles MyBase.Paint
        objBackground = Me.CreateGraphics ' makes a graphics object
        objBackground.DrawImage(imlElsaRight.Images.Item(0), X, Y)
    End Sub
    Private Sub Form1_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles MyBase.KeyDown
        Static WhichImage As Integer = 0 
        If e.KeyCode = Keys.Right Then
            Dim RectCopy As New Rectangle(X, Y, 96, 96)
            objBackground.FillRectangle(New SolidBrush(Me.BackColor), RectCopy)
            X += 16
            WhichImage = (WhichImage + 1) Mod 9
            objBackground.DrawImage(imlElsaRight.Images.Item(WhichImage), X, Y)
            If X >= Me.Width Then 
                X = Me.Width - 1 ' Elsa cannot veer off the page, sorry elsa
            End If
        End If
        If e.KeyCode = Keys.Left Then
            Dim RectCopy As New Rectangle(X, Y, 96, 96)
            objBackground.FillRectangle(New SolidBrush(Me.BackColor), RectCopy)
            X -= 16
            WhichImage = (WhichImage + 1) Mod 9
            objBackground.DrawImage(imlElsaLeft.Images.Item(WhichImage), X, Y)
            If X <= -96 Then 
                X = -95 ' Elsa cannot veer off the page, sorry elsa (second time round)
            End If
        End If
    End Sub
End Class