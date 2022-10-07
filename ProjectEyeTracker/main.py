from sqlite3 import Row
from tkinter import Button, Entry, Frame, Text,  Tk, Label, Toplevel
from tkinter.messagebox import showinfo
from proposition import Proposition
from reader_csv import Load_CSV
from widget_info import Widget_info

# On définit une classe fenêtre 
class Window(Tk):

    def __init__(self):
        #on appelle la base de donnée des questions
        self.bdd_propositions = Load_CSV()
        self.Selected_Proposition = None

        #on initialise la fentre
        Tk.__init__(self)

        # On dimensionne la fenêtre         
        #self.state('zoomed') ## ne marche pas sur linux
        w, h = self.winfo_screenwidth()/2, self.winfo_screenheight()/2
        self.geometry("%dx%d+0+0" % (w, h))

        # On ajoute un titre à la fenêtre
        self.title("Eye Tracker")
        
        # cree le container où on va mettre les frames
        self.container = Frame(self,bg="green")
        #self.container.grid(row=0,column=0,sticky='nsew')
        self.container.pack( fill="both", expand = True)
        #Poids dans le container
        self.container.grid_rowconfigure(0, weight=1)
        self.container.grid_columnconfigure(0, weight=1)

        self.frames = {}
        for F in (Page_Accueil, Page_Reponses,Page_Add_Proposition):
            #cree les différentes frames
            frame = F( self)
            self.frames[F] = frame
            frame.grid(row=0, column=0, sticky="nsew")

        #Affiche la page d'accueil
        self.show_frame(Page_Accueil)

    def show_frame(self, cont):
        for frame in self.frames.values():
            frame.grid_remove()
        frame = self.frames[cont]
        frame.refresh(self)
        frame.grid()

class Page_Accueil(Frame):
    
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

        def Switch_To_Panel(proposition):
                controller.Selected_Proposition=proposition
                controller.show_frame(Page_Reponses)

        for prop in controller.bdd_propositions.Propositions:
            
            button = Button(self.frame, text=prop.question,
                            command=lambda i=prop: Switch_To_Panel(i))
            info = "Reponses :"
            for reponse in prop.reponses:
                info +="\n\t"+reponse
            button_ttp = Widget_info(button, info)
            #button.pack(padx=5, pady=5)
            button.grid(row=count//5, column=count%5,padx=5, pady=5,sticky='ew')

            if count%5==0:
                self.frame.rowconfigure(count//5,weight=1)

            count += 1

        self.button_ajouter =Button(self,text ="Ajouter une question",
                            command=lambda: controller.show_frame(Page_Add_Proposition))
        self.button_ajouter.pack(pady=5,padx=5)
   
    def refresh(self,controller):
        self.frame.pack_forget()
        self.button_ajouter.pack_forget()
        self.onDisplay(controller)


class Page_Add_Proposition(Frame):
    
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
        Button(frame_button,text="Annuler",command=lambda: controller.show_frame(Page_Accueil)).pack(side='left',fill='both',expand=True)
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
            print(self.reponses_entry)

    def remove_reponse(self,frame,reponse):
        self.reponses_entry.remove(reponse)
        print(self.reponses_entry)
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

        b = Button(win, text="Retour \n à l'accueil", command=lambda i=master,w=win,p=Page_Accueil : self.Go_to_Page_(i,w,p))
        b.grid(row=1, column=0,sticky='nswe')

        d = Button(win, text="Ouvrir avec \n l'eye Tracker",command=lambda i=master,w=win,p=Page_Reponses : self.Go_to_Page_(i,w,p))
        d.grid(row=1, column=1,sticky='nswe')

    def Go_to_Page_(self,controller,window,Page):
        window.destroy()
        controller.show_frame(Page)

    def validate(self,controller):
        row=[]
        row.append(self.text_question.get("1.0","end-1c"))
        for rep in self.reponses_entry:
            row.append(rep.get())
        controller.bdd_propositions.Add_Proposition(Proposition(row))
        controller.Selected_Proposition=Proposition(row)

        controller.bdd_propositions.Save()
        self.popup_bonus(controller)



class Page_Reponses(Frame):

    def __init__(self,  controller):
        Frame.__init__(self, controller.container)
        self.onDisplay(controller)
        
    def onDisplay(self,controller):
        # On configure les poids
        self.columnconfigure(0, weight=1)
        self.columnconfigure(1, weight=1)
        self.rowconfigure(0, weight=1)

        # Le Rectangle Question
        question =  controller.Selected_Proposition.question if controller.Selected_Proposition !=None else "Question"
        self.Question = Label(self, text=question,bg="yellow", fg="black", font=('Times 28'))
        self.Question.grid(column=0, row=0,columnspan=2, ipadx=10, ipady=10, sticky="NSEW")

        # Les reponses
        if controller.Selected_Proposition ==None :
            self.display_default()
        else :
            if len(controller.Selected_Proposition.reponses) == 2:
                self.display_2_reponses(controller.Selected_Proposition)
            elif len(controller.Selected_Proposition.reponses) == 3:
                self.display_3_reponses(controller.Selected_Proposition)
            elif len(controller.Selected_Proposition.reponses) == 4:
                self.display_4_reponses(controller.Selected_Proposition)
            else :
                print("Erreur il doit y avoir entre 2 et 4 réponses")
                self.display_default()

        """def motion(event):
            x,y = self.winfo_pointerx()- self.winfo_rootx(), self.winfo_pointery() - self.winfo_rooty()
            w_max,h_max =self.winfo_width(),self.winfo_height()
            w_separtion,h_separtion = w_max//2,h_max- Reponse_4.winfo_height()
            
            if 0 <= x and x <= w_separtion and 0 <=y and y <= h_separtion :
                Reponse_1.config(bg="red")
                Reponse_2.config(bg="white")
                Reponse_3.config(bg="white")
                Reponse_4.config(bg="white")
            elif 0 <= x and x <= w_separtion and y > h_separtion and y <=h_max :
                Reponse_4.config(bg="red")
                Reponse_1.config(bg="white")
                Reponse_2.config(bg="white")
                Reponse_3.config(bg="white")
            elif x<=w_max and x > w_separtion and 0 <=y and y <= h_separtion :
                Reponse_2.config(bg="red")
                Reponse_1.config(bg="white")
                Reponse_4.config(bg="white")
                Reponse_3.config(bg="white")
            elif x<=w_max and x > w_separtion and y > h_separtion and y <=h_max :
                Reponse_3.config(bg="red")
                Reponse_1.config(bg="white")
                Reponse_2.config(bg="white")
                Reponse_4.config(bg="white")
            else :
                Reponse_1.config(bg="white")
                Reponse_2.config(bg="white")
                Reponse_3.config(bg="white")
                Reponse_4.config(bg="white")
            
        self.bind('<Motion>', motion)"""

        button1 = Button(self, text="Retour",
                            command=lambda: controller.show_frame(Page_Accueil))
        button1.grid(column=1, row=0,sticky="E")

    def display_2_reponses(self,prop) :
        # On configure les poids
        self.rowconfigure(1, weight=10)
        self.rowconfigure(2, weight=0)

        # Les Rectangles Reponses
        Reponse_1 = Label(self, text=prop.reponses[0],bg="white",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_1.grid(column=0, row=1, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_2 = Label(self, text=prop.reponses[1],bg="white",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_2.grid(column=1, row=1, ipadx=10, ipady=10, sticky="NSEW")

    def display_4_reponses(self,prop):
        # On configure les poids
        self.rowconfigure(1, weight=5)
        self.rowconfigure(2, weight=5)

        # Les Rectangles Reponses
        Reponse_1 = Label(self, text=prop.reponses[0],bg="white",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_1.grid(column=0, row=1, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_2 = Label(self, text=prop.reponses[1],bg="white",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_2.grid(column=1, row=1, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_3 = Label(self, text=prop.reponses[2],bg="white",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_3.grid(column=0, row=2, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_4 = Label(self, text=prop.reponses[3],bg="white", fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_4.grid(column=1, row=2, ipadx=10, ipady=10, sticky="NSEW")

    def display_3_reponses(self,prop):
        # On configure les poids
        self.rowconfigure(1, weight=5)
        self.rowconfigure(2, weight=5)

        # Les Rectangles Reponses
        Reponse_1 = Label(self, text=prop.reponses[0],bg="white",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_1.grid(column=0, row=1, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_2 = Label(self, text=prop.reponses[1],bg="white",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_2.grid(column=1, row=1, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_3 = Label(self, text=prop.reponses[2],bg="white",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_3.grid(column=0, row=2,columnspan=2, ipadx=10, ipady=10, sticky="NSEW")

    def display_default(self):
        # On configure les poids
        self.rowconfigure(1, weight=5)
        self.rowconfigure(2, weight=5)

        # Les Rectangles Reponses
        Reponse_1 = Label(self, text="Reponse 1",bg="white",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_1.grid(column=0, row=1, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_2 = Label(self, text="Reponse 2",bg="white",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_2.grid(column=1, row=1, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_3 = Label(self, text="Reponse 3",bg="white",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_3.grid(column=0, row=2, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_4 = Label(self, text="Reponse 4",bg="white", fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_4.grid(column=1, row=2, ipadx=10, ipady=10, sticky="NSEW")

    def remove_reponses(self):
        for w in self.grid_slaves():
            w.grid_forget()

    def refresh(self,controller):
        self.remove_reponses()
        self.onDisplay(controller)      


def start_application() -> Window:
    app = Window()
    return app # return application

if __name__ == "__main__" :
    start_application().mainloop()

