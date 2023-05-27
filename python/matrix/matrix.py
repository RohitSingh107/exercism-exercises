class Matrix:
    def __init__(self, matrix_string):
        self.matrix_string = matrix_string

    def row(self, index):
        index_row = []
        for i in self.matrix_string.split("\n")[index-1].split():
            index_row.append(int(i))
        return index_row

    def column(self, index):
        index_col = []
        for i in self.matrix_string.split()[index-1::len(self.matrix_string.split("\n")[0].split())]:
            index_col.append(int(i))
        return index_col
