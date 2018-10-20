def structure(fn):
    ncontent=[]
    f=open("C:\\Users\\Administrator\\Desktop\\python\\python\\labq\\labreport\\static\\o_answer\\"+fn,'r')
    line=list(f)
    space=0
    for i in line:
        content=""
        if i=="{\n":
            if space==0:
                ncontent.append(i)
                
                space=space+3
            else:
                for j in range(space):
                    content=content+" "
                s=content+i
                ncontent.append(s)
            
                space=space+3
        elif i=="}\n":
            cont=""
            for j in range(space-3):
                cont=cont+" "
            s=cont+i
            ncontent.append(s)
        
            space=space-3
        else:
            conts=""
            for j in range(space):
                conts=conts+" "
            s=conts+i
            ncontent.append(s)
    f.close()
    with open("C:\\Users\\Administrator\\Desktop\\python\\python\\labq\\labreport\\static\\final_answer\\"+fn,'w',encoding='utf-8')as f:
        for i in ncontent:
            f.write(i)
    f.close()