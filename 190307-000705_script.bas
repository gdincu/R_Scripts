Attribute VB_Name = "Module1"
Sub formatFile()

Workbooks("export.csv").Sheets("export").Activate
Sheets("export").Cells.Select

With Selection
.Font.Name = "Arial"
.Font.Size = 8
.HorizontalAlignment = xlLeft
.VerticalAlignment = xlTop
End With

Range("A1:C1").Font.Bold = True
Range("A1:C1").Interior.ColorIndex = 44
Range("A1:C1").AutoFilter
Range("A:C").Columns.AutoFit

End Sub
