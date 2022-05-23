# Replace variables in Markdown file
# Sample invocation:
#   sed -f <thisFile> <sourceFile> > <destinationFile>
s/=documentDate=/May 23, 2022/g
s/=pb=/<div style="page-break-after: always;"><\/div>/g
