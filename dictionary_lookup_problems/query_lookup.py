import re, sys
from optparse import OptionParser
parser = OptionParser()
usage = "usage: -f / --file \"file1 file2 file3...\""
parser.add_option("-f", "--file", type="string",
                  help="each individual file",
                  dest="file")

(options, args) = parser.parse_args()
#dictionary_file = sys.argv[1] # read in file
files_db = options.file.rstrip("\n").split() # read in all file database
counter = 0
print "reading in dictionary..."
file_no = 0
valid_files = []


for dictionary_file in files_db:
    try:
      open(dictionary_file, "r")
      file_no = file_no + 1
      valid_files.append(dictionary_file)
      for line in open(dictionary_file, "r"):
          line = line.rstrip("\n")
          counter = counter + 1
    except IOError:
      print "File", dictionary_file, "does not appear to exist."

if(len(valid_files) == 0):
    print "no valid files, will return..."
    sys.exit()

print "reading in done"
print "in total", counter, "lines and", file_no, "valid files in database:"
print valid_files
print "please start input query, exit by typing \"!exit\":"

current_query = raw_input("query>")
# some statistics:
no_files = 1
query_times = 0
while (True):
    current_query = current_query.rstrip("\n")
    if (len(current_query) == 0):
        print "empty query, please do another one..."
    if (current_query == '!exit'):
        # print out statistics
        print "You did ", query_times, " times querying"
        print "Now exiting..."
        break
    elif (len(current_query) != 0):
        # do regex match here
        terms = current_query.split() # split by one or many spaces
        no_matches = 0
        
        # read in file inidividually
        for dictionary_file in valid_files:
            counter = 1
            for line in open(dictionary_file, "r"):
                line = line.rstrip("\n")
                shadow_line = line
            
                # starting matching
                found_status = True
                while (found_status):
                    for component in terms:
                        index = shadow_line.find(component)
                        shadow_line = shadow_line.replace(component, '', 1)
                        if (index == -1):
                            found_status = False
                            break
                    if (found_status == True):
                        break

                if (found_status):
                    no_matches = no_matches + 1
                    print "Found query ", current_query, "in ", dictionary_file, "line", counter
                    print "Sentence catched: ", line
                counter = counter + 1 
        # searching done above
        
        # simple summary
        if (no_matches > 0):
            print "For query", current_query, "we found", no_matches, "matches in total."
        else: 
            print "For query", current_query, "we found no matches." 
    current_query = raw_input("query>")
    query_times = query_times + 1

