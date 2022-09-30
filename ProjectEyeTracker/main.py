from tkinter import Tk, Label


# On définit une classe fenêtre 
class Window(Tk):

    def __init__(self):
        # On appelle le constructeur parent
        super().__init__()

        # On dimensionne la fenêtre         
        #self.state('zoomed') ## ne marche pas sur linux
        w, h = self.winfo_screenwidth()/2, self.winfo_screenheight()/2
        self.geometry("%dx%d+0+0" % (w, h))

        # On configure les poids
        self.columnconfigure(0, weight=1)
        self.columnconfigure(1, weight=1)
        self.rowconfigure(0, weight=1)
        self.rowconfigure(1, weight=5)
        self.rowconfigure(2, weight=5)

        # Le Rectangle Question
        Question = Label(self, text="Question",bg="yellow", fg="black", font=('Times 28'))
        Question.grid(column=0, row=0,columnspan=2, ipadx=10, ipady=10, sticky="NSEW")

        # Les Rectangles Reponses
        Reponse_1 = Label(self, text="Reponse 1",bg="white",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_1.grid(column=0, row=1, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_2 = Label(self, text="Reponse 2",bg="white",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_2.grid(column=1, row=1, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_3 = Label(self, text="Reponse 3",bg="white",fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_3.grid(column=1, row=2, ipadx=10, ipady=10, sticky="NSEW")

        Reponse_4 = Label(self, text="Reponse 4",bg="white", fg="black", font=('Times 28'),borderwidth=2, relief="solid")
        Reponse_4.grid(column=0, row=2, ipadx=10, ipady=10, sticky="NSEW")

        # On ajoute un titre à la fenêtre
        self.title("Eye Tracker")
        
        def motion(event):
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
            
        self.bind('<Motion>', motion)

def start_application() -> Window:
    app = Window()
    return app # return application

if __name__ == "__main__" :
    start_application().mainloop()

