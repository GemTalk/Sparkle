# Replace variables in Markdown file
# Sample invocation:
#   sed -f <thisFile> <sourceFile> > <destinationFile>
s/=documentDate=/March 1, 2022/g
s/=pb=/<div style="page-break-after: always;"><\/div>/g
