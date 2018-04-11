import groovy.io.FileType

def folder = /C:\Users\vigkanda\Work_Place\Documents\General\Spring Data\Videos\The-complete-jenkins-course-for-developers-and-devops/
def dir = new File(folder)
StringWriter str = new StringWriter()
dir.eachDirRecurse{  File directory ->
   str.append("==> " +directory.name)
   str.append("\n")
   
   def innerFiles = new File(directory.absolutePath)
   innerFiles.eachFileRecurse(FileType.FILES){  File file  -> 
       str.append("\t")
       str.append("|")
       str.append("=-> " + file.name)
       str.append("\n")
   }
}

File file = new File(folder+"\\"+dir.name+".txt")
if(!file.exists()){
  file.createNewFile()
 }
file.write(str.toString())

println "**************************************************"
println "**             (.)  (.)                         **"
println "**                |.                            **"
println "**               (__)                           **"
println "**                                              **"
println "**   ===> Written Successfully to the File :)   **"
println "**************************************************"


