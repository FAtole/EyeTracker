from ast import Lambda
from random import randrange
from sqlite3 import Row
from tkinter import Button, Canvas, Entry, Frame, INSERT, PhotoImage, Text,  Tk, Label, Toplevel
from tkinter.messagebox import askyesno, showinfo
from proposition import Proposition
from reader_csv import Load_CSV
from widget_info import Widget_info

# On définit une classe fenêtre 
class Window(Tk):

    def __init__(self):
        #on appelle la base de donnée des questions
        self.bdd_propositions = Load_CSV()
        self.Selected_index=None
        self.Selected_Proposition = None

        #on initialise la fentre
        Tk.__init__(self)

        # On dimensionne la fenêtre         
        #self.state('zoomed') ## ne marche pas sur linux
        self.w, self.h = self.winfo_screenwidth()/2, self.winfo_screenheight()/2
        self.geometry("%dx%d+0+0" % (self.w, self.h))
        #resize off
        self.resizable(False,False)


        # On definit le font
        self.font= ('Times 30') # dans l'eye tracker
        self.option_add( "*font", "Times 10" )


        # On ajoute un titre à la fenêtre
        self.title("Eye Tracker")

        # on charge les images icons
        self.image_modifier = PhotoImage(file='projecteyetracker/asset/images/bouton-modifier.png').subsample(26, 26)
        self.image_delete = PhotoImage(file='projecteyetracker/asset/images/delete.png').subsample(26, 26)
        
        # cree le container où on va mettre les frames
        self.container = Frame(self,bg="green")
        #self.container.grid(row=0,column=0,sticky='nsew')
        self.container.pack( fill="both", expand = True)
        #Poids dans le container
        self.container.grid_rowconfigure(0, weight=1)
        self.container.grid_columnconfigure(0, weight=1)

        self.frames = {}
        for F in (page_accueil, page_reponses,page_add_proposition,page_modifie_proposition):
            #cree les différentes frames
            frame = F( self)
            self.frames[F] = frame
            frame.grid(row=0, column=0, sticky="nsew")

        #Affiche la page d'accueil
        self.show_frame(page_accueil)

    def show_frame(self, cont):
        for frame in self.frames.values():
            frame.grid_remove()
        frame = self.frames[cont]
        frame.refresh(self)
        frame.grid()

class page_accueil(Frame):
    
    def __init__(self,  controller):
        Frame.__init__(self,controller.container)
        self.onDisplay(controller)

    def onDisplay(self,controller):    
        self.frame = Frame(self,relief="groove", borderwidth=2)
        self.frame.pack(fill="both",expand=True,side='top',pady=5,padx=5)
        self.frame.rowconfigure(0,weight=1)
        
        self.frame.columnconfigure(0,weight=1)
        self.frame.columnconfigure(1,weight=1)
        self.frame.columnconfigure(2,weight=1)
        self.frame.columnconfigure(3,weight=1)
        self.frame.columnconfigure(4,weight=1)

        count = 0

        
        for prop in controller.bdd_propositions.Propositions:
            frame = Frame(self.frame)
            button_select = Button(frame, text=prop.question, 
                            command=lambda i=prop,c=controller: self.Switch_To_Panel(i,c,page_reponses))
            info = "Reponses :"
            for reponse in prop.reponses:
                info +="\n\t"+reponse
            Widget_info(button_select, info)
            button_select.pack(side='left')

            button_modifier = Button(frame, image=controller.image_modifier, 
                               command=lambda i=count, c=controller: self.goto_modifie_proposition(i,c))
            button_modifier.pack(side='left')

            button_delete = Button(frame, image=controller.image_delete, 
                            command= lambda i=count,c=controller:self.delete_proposition(i,c))
            button_delete.pack(side='left')

            frame.grid(row=count//5, column=count%5,padx=5, pady=5,sticky='ew')
            
            if count%5==0:
                self.frame.rowconfigure(count//5,weight=1)

            count += 1

        self.button_ajouter =Button(self,text ="Ajouter une question",
                            command=lambda c=controller: self.Switch_To_Panel(None,c,page_add_proposition))
        self.button_ajouter.pack(pady=5,padx=5)
   
    def Switch_To_Panel(self,proposition,controller,page) :
        controller.Selected_Proposition=proposition
        return controller.show_frame(page)
    
    def goto_modifie_proposition(self,index,controller):
        controller.Selected_index =index
        return controller.show_frame(page_modifie_proposition)

    def delete_proposition(self,index,controller) :
        answer = askyesno(title='Confirmation',
                    message='Êtes-vous sûr de vouloir supprimer cette proposition ?')
        if answer:
            controller.bdd_propositions.Remove_proposition(index)
            controller.bdd_propositions.Save()
            self.refresh(controller)

    def refresh(self,controller):
        self.frame.pack_forget()
        self.button_ajouter.pack_forget()
        self.onDisplay(controller)


class page_modifie_proposition(Frame):
    
    def __init__(self,  controller):
        Frame.__init__(self,controller.container)
        self.proposition = controller.bdd_propositions.Get_Proposition(controller.Selected_index) if controller.Selected_index!=None else None
        self.max_de_reponses=4
        self.nbr_de_reponse_actuel=len(self.proposition.reponses) if self.proposition !=None else 2
        self.longeur_max_question =50
        self.reponses_entry =[] 


        self.on_Display(controller)
        
    def on_Display(self,controller):
        # frame  total
        self.frame = Frame(self)
        # frame pour la Question
        Label(self.frame,text="Question :").pack(anchor="w")
        # frame saisie
        frame_question_saisie = Frame(self.frame,padx=15,pady=5)
        self.text_question=Text(frame_question_saisie,height=1, width=40)
        if self.proposition != None :
            self.text_question.insert(INSERT,self.proposition.question)
       
        self.text_question.pack(side='left')
        nbr_char =Label(frame_question_saisie,text=0)
        nbr_char.pack()

        def char_counter(value):
            my_str=self.text_question.get('1.0','end-1c')
            char_numbers=len(my_str)
            nbr_char.config(text=str(char_numbers))  
            if(char_numbers > self.longeur_max_question-1):# supprime si c'est trop long
                self.text_question.delete('end-2c') 

        self.text_question.bind('<KeyRelease>',char_counter) #appel quand on appuie sur le clavier
        
        frame_question_saisie.pack()

        # frame pour les Réponses
        # frame  Titre + add reponse
        frame_reponses_titre = Frame(self.frame)
        frame_reponses_titre.pack(fill='both')
        Label(frame_reponses_titre,text="Réponse :").pack(side='left', anchor="w")
        Button(frame_reponses_titre,text="+",command=self.add_reponse).pack(side='right',anchor='e')
        frame_reponses_titre.pack()

        self.frame_reponses = Frame(self.frame,padx=5,pady=5)

        reponse1=Entry(self.frame_reponses, width=30)
        if self.proposition != None :
            reponse1.insert(INSERT,self.proposition.reponses[0])
       
        reponse1.pack(side='top',padx=5,pady=5,anchor='w')
        reponse2=Entry(self.frame_reponses, width=30)
        if self.proposition != None :
            reponse2.insert(INSERT,self.proposition.reponses[1])
        reponse2.pack(side='top',padx=5,pady=5,anchor='w')

        if self.proposition != None and self.nbr_de_reponse_actuel>2 :
            for reponse in self.proposition.reponses[2:] :
                frame =Frame(self.frame_reponses)
                reponse_entry =Entry(frame, width=30)
                reponse_entry.insert(INSERT,reponse)

                reponse_entry.pack(side='left', anchor='w',padx=5,pady=5)
                self.reponses_entry.append(reponse_entry)

                Button(frame,text="-",command=lambda i=frame,j=reponse_entry :self.remove_reponse(i,j)).pack(side='right',anchor='e',padx=5,pady=5)
                frame.pack(fill='y')

        self.reponses_entry.append(reponse1)
        self.reponses_entry.append(reponse2)
        self.frame_reponses.pack()

        # frame  Boutons
        frame_button = Frame(self.frame)
        frame_button.pack(fill='both')
        Button(frame_button,text="Annuler",command=lambda: controller.show_frame(page_accueil)).pack(side='left',fill='both',expand=True)
        Button(frame_button,text="Valider",command=lambda i=controller :self.validate(i)).pack(side='right',fill='both',expand=True)
        frame_button.pack(pady=20,padx=20)

        self.frame.pack(expand=True)

    def add_reponse(self):
        if self.nbr_de_reponse_actuel<self.max_de_reponses:
            frame =Frame(self.frame_reponses)
            reponse =Entry(frame, width=30)
            reponse.pack(side='left', anchor='w',padx=5,pady=5)
            self.reponses_entry.append(reponse)

            Button(frame,text="-",command=lambda i=frame,j=reponse :self.remove_reponse(i,j)).pack(side='right',anchor='e',padx=5,pady=5)
            frame.pack(fill='y')
            self.frame_reponses.pack()
            self.nbr_de_reponse_actuel += 1

    def remove_reponse(self,frame,reponse):
        self.reponses_entry.remove(reponse)
        frame.pack_forget()
        self.nbr_de_reponse_actuel -= 1
        return self.frame_reponses.pack()

    def refresh(self,controller):
        self.frame.pack_forget()
        self.reponses_entry.clear()
        self.proposition = controller.bdd_propositions.Get_Proposition(controller.Selected_index) if controller.Selected_index!=None else None
        self.nbr_de_reponse_actuel=len(self.proposition.reponses) if self.proposition !=None else 2
        self.on_Display(controller)

    def validate(self,controller):
        row=[]
        row.append(self.text_question.get("1.0","end-1c"))
        for rep in self.reponses_entry:
            row.append(rep.get())
        controller.Selected_Proposition=Proposition(row)
        controller.bdd_propositions.Modify_proposition(controller.Selected_index,controller.Selected_Proposition)
        controller.bdd_propositions.Save()

        answer = askyesno(title='Confirmation',
                    message='Voulez-vous lancer l\'eye tracker ?')
        if answer:
            controller.show_frame(page_reponses)
        else :
            controller.show_frame(page_accueil)


class page_add_proposition(Frame):
    
    def __init__(self,  controller):
        Frame.__init__(self,controller.container)
        self.max_de_reponses=4
        self.nbr_de_reponse_actuel=2
        self.longeur_max_question =50
        self.reponses_entry =[] 


        self.on_Display(controller)
        
    def on_Display(self,controller):
        # frame  total
        self.frame = Frame(self)
        # frame pour la Question
        Label(self.frame,text="Question :").pack(anchor="w")
        # frame saisie
        frame_question_saisie = Frame(self.frame,padx=15,pady=5)
        self.text_question=Text(frame_question_saisie,height=1, width=40)
        self.text_question.pack(side='left')
        nbr_char =Label(frame_question_saisie,text=0)
        nbr_char.pack()

        def char_counter(value):
            my_str=self.text_question.get('1.0','end-1c')
            char_numbers=len(my_str)
            nbr_char.config(text=str(char_numbers))  
            if(char_numbers > self.longeur_max_question-1):# supprime si c'est trop long
                self.text_question.delete('end-2c') 

        self.text_question.bind('<KeyRelease>',char_counter) #appel quand on appuie sur le clavier
        
        frame_question_saisie.pack()

        # frame pour les Réponses
        # frame  Titre + add reponse
        frame_reponses_titre = Frame(self.frame)
        frame_reponses_titre.pack(fill='both')
        Label(frame_reponses_titre,text="Réponse :").pack(side='left', anchor="w")
        Button(frame_reponses_titre,text="+",command=self.add_reponse).pack(side='right',anchor='e')
        frame_reponses_titre.pack()

        self.frame_reponses = Frame(self.frame,padx=5,pady=5)
        reponse1=Entry(self.frame_reponses, width=30)
        reponse1.pack(side='top',padx=5,pady=5,anchor='w')
        reponse2=Entry(self.frame_reponses, width=30)
        reponse2.pack(side='top',padx=5,pady=5,anchor='w')
        self.reponses_entry.append(reponse1)
        self.reponses_entry.append(reponse2)
        self.frame_reponses.pack()

        # frame  Boutons
        frame_button = Frame(self.frame)
        frame_button.pack(fill='both')
        Button(frame_button,text="Annuler",command=lambda: controller.show_frame(page_accueil)).pack(side='left',fill='both',expand=True)
        Button(frame_button,text="Valider",command=lambda i=controller :self.validate(i)).pack(side='right',fill='both',expand=True)
        frame_button.pack(pady=20,padx=20)

        self.frame.pack(expand=True)

    def add_reponse(self):
        if self.nbr_de_reponse_actuel<self.max_de_reponses:
            frame =Frame(self.frame_reponses)
            reponse =Entry(frame, width=30)
            reponse.pack(side='left', anchor='w',padx=5,pady=5)
            self.reponses_entry.append(reponse)

            Button(frame,text="-",command=lambda i=frame,j=reponse :self.remove_reponse(i,j)).pack(side='right',anchor='e',padx=5,pady=5)
            frame.pack(fill='y')
            self.frame_reponses.pack()
            self.nbr_de_reponse_actuel += 1

    def remove_reponse(self,frame,reponse):
        self.reponses_entry.remove(reponse)
        frame.pack_forget()
        self.nbr_de_reponse_actuel -= 1
        return self.frame_reponses.pack()

    def refresh(self,controller):
        self.frame.pack_forget()
        self.reponses_entry.clear()
        self.nbr_de_reponse_actuel=2
        self.on_Display(controller)

    def popup_bonus(self,master):
        win = Toplevel()
        win.wm_title("Information")
        win.grab_set()
        win.rowconfigure(0,weight=1)
        win.rowconfigure(1,weight=2)
        win.columnconfigure(0,weight=1)
        win.columnconfigure(1,weight=1)

        l = Label(win, text="La proposition a bien été enregisté !")
        l.grid(row=0, column=0,columnspan=2,sticky='nswe')

        b = Button(win, text="Retour \n à l'accueil", command=lambda i=master,w=win,p=page_accueil : self.Go_to_Page_(i,w,p))
        b.grid(row=1, column=0,sticky='nswe')

        d = Button(win, text="Ouvrir avec \n l'eye Tracker",command=lambda i=master,w=win,p=page_reponses : self.Go_to_Page_(i,w,p))
        d.grid(row=1, column=1,sticky='nswe')

    def Go_to_Page_(self,controller,window,page):
        window.destroy()
        controller.show_frame(page)

    def validate(self,controller):
        row=[]
        row.append(self.text_question.get("1.0","end-1c"))
        for rep in self.reponses_entry:
            row.append(rep.get())
        controller.bdd_propositions.Add_Proposition(Proposition(row))
        controller.Selected_Proposition=Proposition(row)

        controller.bdd_propositions.Save()
        self.popup_bonus(controller)



class page_reponses(Frame):

    def __init__(self,  controller):
        Frame.__init__(self, controller.container)
        self.onDisplay(controller)
        self.action =None
        
    def onDisplay(self,controller):
        # Canvas
        self.columnconfigure(0, weight=1)
        self.rowconfigure(0, weight=1)
        self.canvas = Canvas(self, width=controller.w, height=controller.h, borderwidth=0, highlightthickness=0)

        # On configure les poids
        self.canvas.columnconfigure(0, weight=1)
        self.canvas.columnconfigure(1, weight=1)
        self.canvas.rowconfigure(0, weight=1)

        
        # Le Rectangle Question
        question =  controller.Selected_Proposition.question if controller.Selected_Proposition !=None else "Question"
        text_question = self.canvas.create_text(controller.w//2, controller.h//11, text =question, font=controller.font)
        x,y,w,h =self.canvas.bbox(text_question)
        #self.Question = Label(self.canvas, text=question,bg="yellow", fg="black", font=controller.font)
        #self.Question.grid(column=0, row=0,columnspan=2, ipadx=10, ipady=10, sticky="NSEW")

        # Les reponses
        if controller.Selected_Proposition ==None :
            self.display_default(controller)
        else :
            if len(controller.Selected_Proposition.reponses) == 2:
                self.display_2_reponses(controller.Selected_Proposition,controller,h=h)
            elif len(controller.Selected_Proposition.reponses) == 3:
                self.display_3_reponses(controller.Selected_Proposition,controller,h=h)
            elif len(controller.Selected_Proposition.reponses) == 4:
                self.display_4_reponses(controller.Selected_Proposition,controller,h=h)
            else :
                print("Erreur il doit y avoir entre 2 et 4 réponses")
                self.display_default(controller)

        button1 = Button(self.canvas, text="Retour",
                            command=lambda: controller.show_frame(page_accueil))
        button1.grid(column=1, row=0,sticky="E")
        self.canvas.grid(sticky="NSEW")
        
        self.action=None
        self.last_points =[]
        
        self.c=controller
        self.Simulation_Regard()
    
    def Simulation_Regard(self):
        controller =self.c
        taille =len(self.last_points)
        print(self.last_points)
        zone_regard =160
        if taille ==0:
            x= randrange(controller.w)
            y= randrange(controller.h)
            id_pt=self.point(x,y,10)
            self.last_points.append((x,y,id_pt,None))
        else :
            if taille >5:
                x_,y_,id_p,id_l=self.last_points[0]
                self.canvas.delete(id_p)
                if id_l != None :self.canvas.delete(id_l)
                self.last_points.pop(0)
            taille = len(self.last_points)
            x,y,id_point,idline=self.last_points[taille-1] # on regarde le dernier point
            self.canvas.itemconfigure(id_point, fill="blue")#change de color
            #on fait un premier deplacement
            x_dep = randrange(zone_regard)-zone_regard//2
            y_dep = randrange(zone_regard)-zone_regard//2

            x_tmp =x+x_dep
            y_tmp =y+y_dep
            #on recommence quand le deplacement n'est pas dans la fenetre
            while (x_tmp<0 or x_tmp > controller.w or y_tmp<0 or y_tmp>controller.h):
                x_dep = randrange(zone_regard)-zone_regard//2
                y_dep = randrange(zone_regard)-zone_regard//2

                x_tmp =x+x_dep
                y_tmp =y+y_dep
            
            id_pt = self.point(x_tmp,y_tmp,10)
            id_line = self.canvas.create_line(x,y, x_tmp,y_tmp)
            self.last_points.append((x_tmp,y_tmp,id_pt,id_line))

        self.action =self.after(2000,self.Simulation_Regard)

    def point(self,x,y,rad):
        cercle = self.canvas.create_oval(x-rad,y-rad,x+rad,y+rad,width=0,fill='red')
        self.canvas.tag_raise(cercle)
        return cercle

    def display_2_reponses(self,prop,controller,h=72) :
        # On configure les poids
        self.canvas.rowconfigure(1, weight=10)
        self.canvas.rowconfigure(2, weight=0)
        h=h+10

        # Les Rectangles Reponses
        #reponse_1 = Label(self.canvas, text=prop.reponses[0],bg="white",fg="black", font=controller.font,borderwidth=2, relief="solid")
        #reponse_1.grid(column=0, row=1, ipadx=10, ipady=10, sticky="NSEW")
        self.canvas.create_rectangle(0, h, controller.w//2, controller.h, fill="white")
        self.canvas.create_text(controller.w//4, (controller.h-h)//2+h, text=prop.reponses[0], fill="black", font=controller.font)

        #reponse_2 = Label(self.canvas, text=prop.reponses[1],bg="white",fg="black", font=controller.font,borderwidth=2, relief="solid")
        #reponse_2.grid(column=1, row=1, ipadx=10, ipady=10, sticky="NSEW")
        self.canvas.create_rectangle(controller.w//2, h, controller.w, controller.h, fill="white")
        self.canvas.create_text(controller.w//4*3, (controller.h-h)//2+h, text=prop.reponses[1], fill="black", font=controller.font)

    def display_4_reponses(self,prop,controller,h=72):
        # On configure les poids
        self.canvas.rowconfigure(1, weight=5)
        self.canvas.rowconfigure(2, weight=5)

        h=h+10
        # Les Rectangles Reponses
        #reponse_1 = Label(self.canvas, text=prop.reponses[0],bg="white",fg="black", font=controller.font,borderwidth=2, relief="solid")
        #reponse_1.grid(column=0, row=1, ipadx=10, ipady=10, sticky="NSEW")
        self.canvas.create_rectangle(0, h, controller.w//2, (controller.h-h)//2+h, fill="white")
        self.canvas.create_text(controller.w//4, (controller.h-h)//4+h, text=prop.reponses[0], fill="black", font=controller.font)

        #reponse_2 = Label(self.canvas, text=prop.reponses[1],bg="white",fg="black", font=controller.font,borderwidth=2, relief="solid")
        #reponse_2.grid(column=1, row=1, ipadx=10, ipady=10, sticky="NSEW")
        self.canvas.create_rectangle(controller.w//2, h, controller.w, (controller.h-h)//2+h, fill="white")
        self.canvas.create_text(controller.w//4*3, (controller.h-h)//4+h, text=prop.reponses[1], fill="black", font=controller.font)

        #reponse_3 = Label(self.canvas, text=prop.reponses[2],bg="white",fg="black", font=controller.font,borderwidth=2, relief="solid")
        #reponse_3.grid(column=0, row=2, ipadx=10, ipady=10, sticky="NSEW")
        self.canvas.create_rectangle(0, h+(controller.h-h)//2, controller.w//2, controller.h, fill="white")
        self.canvas.create_text(controller.w//4, (controller.h-h)//4*3+h, text=prop.reponses[2], fill="black", font=controller.font)

        #reponse_4 = Label(self.canvas, text=prop.reponses[3],bg="white", fg="black", font=controller.font,borderwidth=2, relief="solid")
        #reponse_4.grid(column=1, row=2, ipadx=10, ipady=10, sticky="NSEW")
        self.canvas.create_rectangle(controller.w//2,  h+(controller.h-h)//2, controller.w, controller.h, fill="white")
        self.canvas.create_text(controller.w//4*3, (controller.h-h)//4*3+h, text=prop.reponses[3], fill="black", font=controller.font)

    def display_3_reponses(self,prop,controller,h=72):
        # On configure les poids
        self.canvas.rowconfigure(1, weight=5)
        self.canvas.rowconfigure(2, weight=5)
        h=h+10
        # Les Rectangles Reponses
        #reponse_1 = Label(self.canvas, text=prop.reponses[0],bg="white",fg="black", font=controller.font,borderwidth=2, relief="solid")
        #reponse_1.grid(column=0, row=1, ipadx=10, ipady=10, sticky="NSEW")
        self.canvas.create_rectangle(0, h, controller.w//2, (controller.h-h)//2+h, fill="white")
        self.canvas.create_text(controller.w//4, (controller.h-h)//4+h, text=prop.reponses[0], fill="black", font=controller.font)

        #reponse_2 = Label(self.canvas, text=prop.reponses[1],bg="white",fg="black", font=controller.font,borderwidth=2, relief="solid")
        #reponse_2.grid(column=1, row=1, ipadx=10, ipady=10, sticky="NSEW")
        self.canvas.create_rectangle(controller.w//2, h, controller.w, (controller.h-h)//2+h, fill="white")
        self.canvas.create_text(controller.w//4*3, (controller.h-h)//4+h, text=prop.reponses[1], fill="black", font=controller.font)

        #reponse_3 = Label(self.canvas, text=prop.reponses[2],bg="white",fg="black", font=controller.font,borderwidth=2, relief="solid")
        #reponse_3.grid(column=0, row=2,columnspan=2, ipadx=10, ipady=10, sticky="NSEW")
        self.canvas.create_rectangle(0, h+(controller.h-h)//2, controller.w, controller.h, fill="white")
        self.canvas.create_text(controller.w//2, (controller.h-h)//4*3+h, text=prop.reponses[2], fill="black", font=controller.font)

    def display_default(self,controller,h=72):
        # On configure les poids
        self.canvas.rowconfigure(1, weight=5)
        self.canvas.rowconfigure(2, weight=5)

        # Les Rectangles Reponses
        """
        reponse_1 = Label(self.canvas, text="Reponse 1",bg="white",fg="black", font=controller.font,borderwidth=2, relief="solid")
        reponse_1.grid(column=0, row=1, ipadx=10, ipady=10, sticky="NSEW")

        reponse_2 = Label(self.canvas, text="Reponse 2",bg="white",fg="black", font=controller.font,borderwidth=2, relief="solid")
        reponse_2.grid(column=1, row=1, ipadx=10, ipady=10, sticky="NSEW")

        reponse_3 = Label(self.canvas, text="Reponse 3",bg="white",fg="black", font=controller.font,borderwidth=2, relief="solid")
        reponse_3.grid(column=0, row=2, ipadx=10, ipady=10, sticky="NSEW")

        reponse_4 = Label(self.canvas, text="Reponse 4",bg="white", fg="black",font=controller.font,borderwidth=2, relief="solid")
        reponse_4.grid(column=1, row=2, ipadx=10, ipady=10, sticky="NSEW")"""
        h=h+10
        # Les Rectangles Reponses
        self.canvas.create_rectangle(0, h, controller.w//2, (controller.h-h)//2+h, fill="white")
        self.canvas.create_text(controller.w//4, (controller.h-h)//4+h, text="Reponse1", fill="black", font=controller.font)

        self.canvas.create_rectangle(controller.w//2, h, controller.w, (controller.h-h)//2+h, fill="white")
        self.canvas.create_text(controller.w//4*3, (controller.h-h)//4+h, text="Reponse2", fill="black", font=controller.font)

        self.canvas.create_rectangle(0, h+(controller.h-h)//2, controller.w//2, controller.h, fill="white")
        self.canvas.create_text(controller.w//4, (controller.h-h)//4*3+h, text="Reponse3", fill="black", font=controller.font)

        self.canvas.create_rectangle(controller.w//2,  h+(controller.h-h)//2, controller.w, controller.h, fill="white")
        self.canvas.create_text(controller.w//4*3, (controller.h-h)//4*3+h, text="Reponse4", fill="black", font=controller.font)

    def remove_reponses(self):
        for w in self.grid_slaves():
            w.grid_forget()

    def refresh(self,controller):
        self.remove_reponses()
        self.onDisplay(controller) 
        self.action=None     


def start_application() -> Window:
    app = Window()
    return app 

if __name__ == "__main__" :
    start_application().mainloop()

