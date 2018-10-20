from django.shortcuts import render
from django.http import HttpResponse
from labreport import dbconnection
from django.http import HttpResponseRedirect
from django.template import RequestContext
from django.core.files.storage import FileSystemStorage
import xlrd 

# Create your views here.
#Public Views
def index(request):
    return render(request,"index.html",{})
def login(request):
    if request.method=='POST':
        a=request.POST.get('u')
        b=request.POST.get('p')
        sql="select * from user_log where uid='"+a+"' and pass='"+b+"'"
        data=dbconnection.selectdata(sql)         
        if data:                        
            if data[3]=="admin":
                request.session['x']=a
                return HttpResponseRedirect("http://127.0.0.1:8000/adminhome")
            elif data[3]=="staff":
                request.session['st']=a
                return HttpResponseRedirect("http://127.0.0.1:8000/staffhome")
            elif data[3]=="stud":
                request.session['stud']=a
                return HttpResponseRedirect("http://127.0.0.1:8000/studenthome")
        else:
            e="Invalid"
            return render(request,'login.html',{'error':e})
    return render(request,"login.html",{})


#admin Area
def adminhome(request):
    return render(request,"administrator/index.html",{})
def managecourse(request):
    if request.method=='POST':
        dep=request.POST.get('d')
        sem=request.POST.get('sem')
        sc=request.POST.get('sc')
        sn=request.POST.get('sn')
        sql="insert into subject_data values ('','"+dep+"','"+sem+"','"+sc+"','"+sn+"','0')"
        if dbconnection.insertdata(sql):        
            x="Insert Successfully"
            return render(request,"administrator/addsubject.html",{"x":x})
    sql="select * from subject_data order by sem asc"
    data=dbconnection.selectalldata(sql)
    if data:
        jj=0
        return render(request,"administrator/addsubject.html",{"data":data,"inc":jj})
    return render(request,"administrator/addsubject.html",{})

def deletecourse(request,qs):
    qry="delete from subject_data where id='"+str(qs)+"'"    
    dbconnection.deletedata(qry)
    return HttpResponseRedirect("http://127.0.0.1:8000/managecourse")    
    
def managestaff(request):    
    qry1="select * from staff_data"
    data1=dbconnection.selectalldata(qry1)
    if request.method=='POST':        
        sn=request.POST.get('sn')
        con=request.POST.get('con')
        addr=request.POST.get('addr')
        myfile=request.FILES['up']
        fs=FileSystemStorage()
        filename=fs.save("C:\\Users\\sudhe\\Desktop\\python\\labq-cut1\\labq-cut1\\labreport\\static\\userpic\\"+myfile.name,myfile)
        u=request.POST.get('u')
        p=request.POST.get('p')
        qry="insert into staff_data values('','"+sn+"','"+con+"','"+addr+"','"+myfile.name+"','"+u+"','1')"
        dbconnection.insertdata(qry)
        qry="insert into user_log values('','"+u+"','"+p+"','staff','1')"
        dbconnection.insertdata(qry)
        return HttpResponseRedirect("http://127.0.0.1:8000/managestaff")
    return render(request,"administrator/addstaff.html",{'stf':data1})

def deletestaff(request,qs):
    qry="delete from staff_data where uid='"+str(qs)+"'"    
    dbconnection.deletedata(qry)
    qry="delete from user_log where uid='"+str(qs)+"'"    
    dbconnection.deletedata(qry)
    return HttpResponseRedirect("http://127.0.0.1:8000/managestaff")   

def managestudent(request):
    qry1="select * from student_data"
    data3=dbconnection.selectalldata(qry1)
    if request.method=='POST':        
        sem=request.POST.get('sem')
        sn=request.POST.get('sn')
        rn=request.POST.get('rn')
        p=request.POST.get('p')
        con=request.POST.get('con')
        addr=request.POST.get('addr')
        myfile=request.FILES['up']
        fs=FileSystemStorage()
        filename=fs.save("C:\\Users\\sudhe\\Desktop\\python\\labq-cut1\\labq-cut1\\labreport\\static\\studpic\\"+myfile.name,myfile)
        qry="insert into student_data values('','"+sem+"','"+sn+"','"+rn+"','"+con+"','"+addr+"','"+myfile.name+"','1')"
        dbconnection.insertdata(qry)
        qry="insert into user_log values('','"+rn+"','"+p+"','stud','1')"
        dbconnection.insertdata(qry)
        return HttpResponseRedirect("http://127.0.0.1:8000/managestudent")
    return render(request,"administrator/addstudent.html",{'data':data3})

def assignsubject(request,sid):
    qry="select * from staff_data where uid='"+str(sid)+"'" 
    data=dbconnection.selectdata(qry) 
    qry="select subj_id,subj_nme  from subject_data"
    data1=dbconnection.selectalldata(qry)
    qry1="select * from subj_assign where stf_id='"+str(sid)+"'"
    data3=dbconnection.selectalldata(qry1)
    if request.method=='POST':        
        sn=request.POST.get('sn')
        subj=request.POST.get('subj')
        x=subj.split(',')
        qry="insert into subj_assign values ('','"+x[0]+"','"+x[1]+"','"+sn+"')"
        dbconnection.insertdata(qry)
        return HttpResponseRedirect("http://127.0.0.1:8000/assignsubject/"+sn)    
    return render(request,"administrator/assign.html",{'data':data,'sdata':data1,'subj':data3})

def xlupload(request):
    if request.method=='POST':
        myfile=request.FILES['upxl']
        fs=FileSystemStorage()
        filename=fs.save("C:\\Users\\sudhe\\Desktop\\python\\labq-cut1\\labq-cut1\\labreport\\static\\studpic\\"+myfile.name,myfile)
        n=myfile.name
        print(n)
        loc = ("C:\\Users\\sudhe\\Desktop\\python\\labq-cut1\\labq-cut1\\labreport\\static\\studpic\\"+n) 
        wb = xlrd.open_workbook(loc) 
        sheet = wb.sheet_by_index(0) 
        sheet.cell_value(0, 0) 
        for i in range(5,sheet.nrows): 
            s1=str(int(sheet.cell_value(i, 6)))
            s2=str(sheet.cell_value(i, 3))
            s3=sheet.cell_value(i, 1)
            s4=sheet.cell_value(i, 10)
            if s4:
                s4 = str(int(s4))
            s5=str(sheet.cell_value(i,8))
            s6=''
            s7='1' 
            qry="insert into student_data values('','"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"')"
            dbconnection.insertdata(qry)
            qry="insert into user_log values('','"+s2+"','"+s3+"','stud','1')"
            dbconnection.insertdata(qry)
        return HttpResponseRedirect("http://127.0.0.1:8000/xlupload")
    return render(request,"administrator/xlupload.html",{})

def viewxl(request):
    if request.method=='POST':
        sem=request.POST.get('sems')
        qry="select * from student_data where sem='"+sem+"'"
        data4=dbconnection.selectalldata(qry)
        return render(request,"administrator/viewxl.html",{'data':data4})
    return render(request,"administrator/viewxl.html",{})

#Staff Area
  
def staffhome(request):
    return render(request,"staff/index.html",{})