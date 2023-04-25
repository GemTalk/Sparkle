# Replace variables in Markdown file
# Sample invocation:
#   sed -f <thisFile> <sourceFile> > <destinationFile>
s/=documentDate=/Apr 24, 2023/g
s/=pb=/<div style="page-break-after: always;"><\/div>/g
