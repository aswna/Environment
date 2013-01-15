" Utilize '-*-python-*-' like comments in the first 5 lines of any file.
if string(getline(1,5)) =~? '-\*- \{,1}python \{,1}-\*-'
  setfiletype python
endif
