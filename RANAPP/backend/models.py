from unicodedata import name
from django.db import models
Type_Choices=(
    ('Online','Online'),
    ('Physical','Physical')
)
# Create your models here.
class ProgramDetail(models.Model):
    ProgramID = models.AutoField(primary_key=True)
    ProgramName= models.CharField(max_length=100)
    Objectives= models.TextField(blank=False , help_text='Enter in bullet points')
    Goals= models.TextField(blank=False,help_text='Enter in bullet points')
    StartDate= models.DateField(blank=False)
    EndDate= models.DateField(blank=False)
    ProgramType = models.TextField( 
        choices = Type_Choices)
    ProgramIcon = models.ImageField(upload_to='images/Photo/Program/',height_field=None, width_field=None,default='default.jpg')


    def __str__(self):
        return self.ProgramName


class EventDetail(models.Model):
    EventID = models.AutoField(primary_key=True)
    EventName= models.CharField(max_length=100)
    EventDescription= models.TextField(blank=False)
    Eventdate=models.DateField(blank=False)
    eventype= models.TextField(
        choices = Type_Choices)
    EventIcon = models.ImageField(upload_to='images/Photo/Event/',height_field=None, width_field=None,default='default.jpg')


    def __str__(self):
        return self.EventName

class ServiceDetail(models.Model):
    ServicesID = models.AutoField(primary_key=True)
    ServiceName= models.CharField(max_length=100)
    ServiceDescription= models.TextField(blank=False)
    Servicedate=models.DateField(blank=False)
    servicetype= models.TextField(
        choices = Type_Choices)
    serviceIcon = models.ImageField(upload_to='images/Photo/services/',height_field=None, width_field=None,default='default.jpg')



    def __str__(self):
        return self.ServiceName

class ProjectDetail(models.Model):
    ProjectID = models.AutoField(primary_key=True)
    ProjectName= models.CharField(max_length=100,verbose_name = "Project Name")
    ProjectDescription= models.TextField(blank=True, null= True ,verbose_name = "Description")
    Projectdate=models.DateField(blank=True,verbose_name = "Date")
    ProjectPOCname=models.CharField(max_length=100,verbose_name = "Contact person")
    ProjectPOCnum=models.CharField(max_length=10 ,verbose_name = "Contact number")
    Projectype= models.TextField(
        choices = Type_Choices,verbose_name = "Type")
    Projectlink = models.URLField(help_text="url link",blank=True)
    ProjectTechnicalspecification = models.FileField(upload_to ='doc/',verbose_name="Technical specification",blank=True,help_text= 'The file must be in pdf')
    ProjectWhitepapers = models.FileField(upload_to ='doc/whitepapers',verbose_name='White papers',blank=True,help_text= 'The file must be in pdf')
    ProjectCoverphoto = models.ImageField(upload_to='images/coverphoto/ProjectDetails/', height_field=None, width_field=None, max_length=100,default='defaultcover.jpg', help_text= 'The size must be --- and the resoultion is ---')
    ProjectIcon =models.ImageField(upload_to='images/Photo/ProjectDetails/', height_field=None, width_field=None, max_length=100,default='default.jpg',help_text= 'The size must be --- and the resoultion is ---')
    
    
    def __str__(self):
        return self.ProjectName 


class TenureDetail(models.Model):
    Year = models.CharField(verbose_name="year",help_text="for eg: 2021-22" , max_length=8)

    def __str__(self):
        return self.Year 

class Categorymember(models.Model):
    CatType = models.CharField(verbose_name="Membership type",max_length=20)    

    def __str__(self):
        return self.CatType 


       
class membership(models.Model):
    MembershipID = models.AutoField(primary_key=True)
    name = models.CharField(verbose_name="Membername",max_length=100)
    pic = models.ImageField(verbose_name="Member photo" ,upload_to='images/membersphotos/', height_field=None, width_field=None,default='default.jpg',help_text= 'The size must be --- and the resoultion is ---' )
    MembershipYear = models.ForeignKey( TenureDetail , on_delete= models.CASCADE )
    CategoryType = models.ForeignKey(Categorymember, on_delete=models.CASCADE)
    socialsite1 = models.URLField(verbose_name="facebook link" , blank= True)
    socialsite2 = models.URLField(verbose_name="Linkedin link" , blank= True)
    socialsite3 = models.URLField(verbose_name="Instagram link" , blank= True)
    

    def __str__(self):
        return self.name 