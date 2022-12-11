Q6 - FillRectangle creates a filled shape whereas DrawRectangle only creates an outline.

Q7 - The arguments are imlWolf.Images.Item(WhichImage), X, and Y.

Q8 - `Dim MyArea As New Rectangle (72, 48, 112, 64)`

Q10 - `Dim objBackground As Graphics`
`Dim X As Integer = 30, Y As Integer = 70`
`Private Sub Form1_Paint(ByVal sender As Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles MyBase.Paint` 
  `objBackground = Me.CreateGraphics`
  `objBackground.DrawImage(imlElsa.Images.Item(0), X, Y)`
`End Sub`
