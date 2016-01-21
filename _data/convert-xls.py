import csv, openpyxl, re, sys, optparse

def readExcel(inputfilename):
    data = []
    wb = openpyxl.load_workbook(inputfilename)
    for ws in wb:
        for wr in ws.rows:
            row = []
            for cell in wr:
                row.append(cell.value)
            data.append(row)
    return data

def writeCSV(outputHeader, outputRows, outputFileName):
    with open(outputFileName, 'wb') as outputfile:
        outputf = csv.writer(outputfile, quoting=csv.QUOTE_NONNUMERIC)
        outputf.writerow(outputHeader)
        for outputRow in outputRows:
            outputf.writerow(outputRow)

if __name__ == '__main__':
    optparser = optparse.OptionParser()
    optparser.add_option("-i", "--inputfile", dest="inputfile", help="input filename (Excel)")
    optparser.add_option("-o", "--outputfile", dest="outputfile", help="output filename (CSV)")
    (opts, _) = optparser.parse_args()
    data = readExcel(opts.inputfile)
    writeCSV()


