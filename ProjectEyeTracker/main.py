from tkinter import Button, Frame, Tk, Label
from reader_csv import Load_CSV

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
        self.container = Frame(self)
        self.container.pack(side="top", fill="both", expand = True)
        #Poids dans le container
        self.container.grid_rowconfigure(0, weight=1)
        self.container.grid_columnconfigure(0, weight=1)

        self.frames = {}
        for F in (Page_Accueil, Page_Reponses):
            #cree les différentes frames
            frame = F(self.container, self)
            self.frames[F] = frame
            frame.grid(row=0, column=0, sticky="nsew")

        #Affiche la page d'accueil
        self.show_frame(Page_Accueil)

    def show_frame(self, cont):
        for frame in self.frames.values():
            frame.grid_remove()
        frame = self.frames[cont]
        frame.refresh(self.container,self)
        frame.grid()

class Page_Accueil(Frame):

    def __init__(self, parent, controller):
        Frame.__init__(self,parent)

        for prop in controller.bdd_propositions.Propositions:
            def Switch_To_Panel(proposition):
                controller.Selected_Proposition=proposition
                controller.show_frame(Page_Reponses)
            button = Button(self, text=prop.question,
                            command=lambda i=prop: Switch_To_Panel(i))
            button.pack()

    def refresh(self,parent,controller):
        self.destroy()
        self.__init__(parent,controller)

class Page_Reponses(Frame):

    def __init__(self, parent, controller):
        Frame.__init__(self, parent)

        print(controller.Selected_Proposition)
        question =  controller.Selected_Proposition.question if controller.Selected_Proposition !=None else "Question"

        # On configure les poids
        self.columnconfigure(0, weight=1)
        self.columnconfigure(1, weight=1)
        self.rowconfigure(0, weight=1)


        # Le Rectangle Question
        Question = Label(self, text=question,bg="yellow", fg="black", font=('Times 28'))
        Question.grid(column=0, row=0,columnspan=2, ipadx=10, ipady=10, sticky="NSEW")

        self.rowconfigure(1, weight=5)
        self.rowconfigure(2, weight=5)

        # Les Rectangles Reponses
        Reponse_1 = Label(self, text="Reponse 1",bg="white",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_1.grid(column=0, row=1, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_2 = Label(self, text="Reponse 2",bg="white",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_2.grid(column=1, row=1, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_3 = Label(self, text="Reponse 3",bg="white",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_3.grid(column=1, row=2, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_4 = Label(self, text="Reponse 4",bg="white", fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_4.grid(column=0, row=2, ipadx=10, ipady=10, sticky="NSEW")

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

        button1 = Button(self, text="Home",
                            command=lambda: controller.show_frame(Page_Accueil))
        button1.grid(column=1, row=0,sticky="E")

    def refresh(self,parent,controller):
        self.destroy()
        self.__init__(parent,controller)

def start_application() -> Window:
    app = Window()
    return app # return application

if __name__ == "__main__" :
    start_application().mainloop()

