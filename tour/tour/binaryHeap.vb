Imports System.Collections.Generic
Imports System
Imports System.Linq

Public Class BinaryHeap
    Private _myTree As Pair()
    Private _mySize As Integer

    Public Function count() As Integer
        Return _mySize
    End Function

#Region "CONSTRUCTORS"

    Public Sub New()
        ReDim _myTree(1024)
        _mySize = 0
    End Sub

#End Region

#Region "PUBLIC METHODS"

    ''' <summary>
    ''' insert node and raise to due height
    ''' </summary>
    ''' <param name="obj"></param>
    ''' <param name="c"></param>
    ''' <remarks></remarks>
    Public Sub Enqueue(obj As Integer, c As Double)
        'increase tree size counter
        _mySize += 1

        'redim tree if necesssary
        If _mySize + 1 > _myTree.Length Then
            ReDim Preserve _myTree(_myTree.Length * 2 - 1)
        End If

        'add new pair
        _myTree(_mySize).c = c ' = New Pair(c, obj)
        _myTree(_mySize).o = obj
        percUp()
    End Sub

    ''' <summary>
    ''' extract the best node and raise the best branch
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function Dequeue() As Integer

        Dim obj As Integer = _myTree(1).o

        'move last to top
        _myTree(1) = _myTree(_mySize)

        'shrink
        _mySize -= 1
        percDown()

        Return obj

    End Function

#End Region

#Region "PRIVATE METHODS"

    Private Sub percUp()
        Dim tmp As Pair

        Dim i As Integer = _mySize
        Dim i2 As Integer = i \ 2

        While i2 > 0 AndAlso _myTree(i).c < _myTree(i2).c
            tmp = _myTree(i2)

            _myTree(i2) = _myTree(i)
            _myTree(i) = tmp

            i = i2
            i2 = i \ 2
        End While

    End Sub

    Private Sub percDown()
        Dim i As Integer = 1

        'min child index
        Dim mc As Integer

        'swap variables
        Dim tmp As Pair
        'mc = MinChild(i)
        'inline the minchild
        Dim i2 As Integer = 2 * i

        If i2 + 1 > _mySize Then
            mc = i2
        Else
            If _myTree(i2).c < _myTree(i2 + 1).c Then
                mc = i2
            Else
                mc = i2 + 1
            End If
        End If


        While (i * 2) <= _mySize AndAlso _myTree(i).c > _myTree(mc).c

            'swap
            tmp = _myTree(mc)
            _myTree(mc) = _myTree(i)
            _myTree(i) = tmp

            'update indices
            i = mc

            'inline minchild
            i2 = 2 * i

            If i2 + 1 > _mySize Then
                mc = i2
            Else
                If _myTree(i2).c < _myTree(i2 + 1).c Then
                    mc = i2
                Else
                    mc = i2 + 1
                End If
            End If
        End While

    End Sub

#End Region

    Private Structure Pair
        Public c As Double
        Public o As Integer
    End Structure
End Class

Public Class BinaryHeap(Of T)
        Private _myTree As Pair()
        Private _mySize As Integer

        Public Function count() As Integer
            Return _mySize
        End Function

#Region "CONSTRUCTORS"

        Public Sub New()
            ReDim _myTree(1024)
            _mySize = 0
        End Sub

#End Region

#Region "PUBLIC METHODS"

        ''' <summary>
        ''' insert node and raise to due height
        ''' </summary>
        ''' <param name="obj"></param>
        ''' <param name="c"></param>
        ''' <remarks></remarks>
        Public Sub Insert(obj As T, c As Double)
            'increase tree size counter
            _mySize += 1

            'redim tree if necesssary
            If _mySize + 1 > _myTree.Length Then
                ReDim Preserve _myTree(_myTree.Length * 2 - 1)
            End If

            'add new pair
            _myTree(_mySize).c = c ' = New Pair(c, obj)
            _myTree(_mySize).o = obj
            percUp()
        End Sub

        ''' <summary>
        ''' extract a node and raise the best branch
        ''' </summary>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Function Extract() As T

            Dim obj As T = _myTree(1).o

            'move last to top
            _myTree(1) = _myTree(_mySize)

            'shrink
            _mySize -= 1
            percDown()

            Return obj

        End Function

#End Region

#Region "PRIVATE METHODS"

        Private Sub percUp()
            Dim tmp As Pair

            Dim i As Integer = _mySize
            Dim i2 As Integer = i \ 2

            While i2 > 0 AndAlso _myTree(i).c < _myTree(i2).c
                tmp = _myTree(i2)

                _myTree(i2) = _myTree(i)
                _myTree(i) = tmp

                i = i2
                i2 = i \ 2
            End While

        End Sub

        Private Sub percDown()
            Dim i As Integer = 1

            'min child index
            Dim mc As Integer

            'swap variables
            Dim tmp As Pair
            'mc = MinChild(i)
            'inline the minchild
            Dim i2 As Integer = 2 * i

            If i2 + 1 > _mySize Then
                mc = i2
            Else
                If _myTree(i2).c < _myTree(i2 + 1).c Then
                    mc = i2
                Else
                    mc = i2 + 1
                End If
            End If


            While (i * 2) <= _mySize AndAlso _myTree(i).c > _myTree(mc).c

                'swap
                tmp = _myTree(mc)
                _myTree(mc) = _myTree(i)
                _myTree(i) = tmp

                'update indices
                i = mc

                'inline minchild
                i2 = 2 * i

                If i2 + 1 > _mySize Then
                    mc = i2
                Else
                    If _myTree(i2).c < _myTree(i2 + 1).c Then
                        mc = i2
                    Else
                        mc = i2 + 1
                    End If
                End If
            End While

        End Sub

#End Region

        Private Structure Pair
            Public c As Double
            Public o As T
        End Structure
    End Class

Public Class BinaryHeap(Of Cost As IComparable, T)
    Private _myTree As Pair()
    Private _mySize As Integer

    Public Function count() As Integer
        Return _mySize
    End Function

#Region "CONSTRUCTORS"

    Public Sub New()
        ReDim _myTree(1024)
        _mySize = 0
    End Sub

#End Region

#Region "PUBLIC METHODS"

    ''' <summary>
    ''' insert node and raise to due height
    ''' </summary>
    ''' <param name="obj"></param>
    ''' <param name="c"></param>
    ''' <remarks></remarks>
    Public Sub Insert(obj As T, c As Cost)
        'increase tree size counter
        _mySize += 1

        'redim tree if necesssary
        If _mySize + 1 > _myTree.Length Then
            ReDim Preserve _myTree(_myTree.Length * 2 - 1)
        End If

        'add new pair
        _myTree(_mySize) = New Pair(c, obj)
        percUp()
    End Sub

    ''' <summary>
    ''' extract a node and raise the best branch
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function Extract() As T

        Dim obj As T = _myTree(1).o

        'move last to top
        _myTree(1) = _myTree(_mySize)

        'shrink
        _mySize -= 1
        percDown()

        Return obj

    End Function

#End Region

#Region "PRIVATE METHODS"

    Private Sub percUp()
        Dim tmp As Pair

        Dim i As Integer = _mySize
        Dim i2 As Integer = i \ 2

        While i2 > 0 AndAlso _myTree(i).CompareTo(_myTree(i2)) < 0
            tmp = _myTree(i2)

            _myTree(i2) = _myTree(i)
            _myTree(i) = tmp

            i = i2
            i2 = i \ 2
        End While

    End Sub

    Private Sub percDown()
        Dim i As Integer = 1

        'min child index
        Dim mc As Integer

        'swap variables
        Dim tmp As Pair
        mc = MinChild(i)

        While (i * 2) <= _mySize AndAlso _myTree(i).CompareTo(_myTree(mc)) > 0

            'swap
            tmp = _myTree(mc)
            _myTree(mc) = _myTree(i)
            _myTree(i) = tmp

            'update indices
            i = mc
            mc = MinChild(i)

        End While

    End Sub


    ''' <summary>
    ''' return index of min child of node i
    ''' </summary>
    ''' <param name="i"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Private Function MinChild(i As Integer) As Integer

        Dim i2 As Integer = 2 * i

        If i2 + 1 > _mySize Then
            Return i2
        Else
            If _myTree(i2).CompareTo(_myTree(i2 + 1)) < 0 Then
                Return i2
            Else
                Return i2 + 1
            End If
        End If

    End Function

#End Region


    Private Class Pair
        Implements IComparable(Of Pair)

        Private _c As Cost
        Public ReadOnly Property c As Cost
            Get
                Return Me._c
            End Get
        End Property

        Private _o As T
        Public ReadOnly Property o As T
            Get
                Return Me._o
            End Get
        End Property

        Public Sub New(cost As Cost, obj As T)
            _c = cost
            _o = obj
        End Sub

        Public Function CompareTo(other As Pair) As Integer Implements IComparable(Of Pair).CompareTo
            Return Me._c.CompareTo(other.c)

        End Function
    End Class
End Class

