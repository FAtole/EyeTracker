from tkinter import Tk, Label


# On définit une classe fenêtre 
class MyWindow(Tk):

    def __init__(self):
        # On appelle le constructeur parent
        super().__init__()


        # On dimensionne la fenêtre en plein ecran         
        #self.state('zoomed') 
        w, h = self.winfo_screenwidth()/2, self.winfo_screenheight()/2
        self.geometry("%dx%d+0+0" % (w, h))

        # On configure les poids
        self.columnconfigure(0, weight=1)
        self.columnconfigure(1, weight=1)
        self.rowconfigure(0, weight=1)
        self.rowconfigure(1, weight=1)

        # Les Rectangles
        rectangle_1 = Label(self, text="Rectangle 1", bg="green", fg="white")
        rectangle_1.grid(column=0, row=0, ipadx=10, ipady=10, sticky="NSEW")

        rectangle_2 = Label(self, text="Rectangle 2", bg="red", fg="white")
        rectangle_2.grid(column=1, row=0, ipadx=10, ipady=10, sticky="NSEW")

        rectangle_3 = Label(self, text="Rectangle 3", bg="blue", fg="white")
        rectangle_3.grid(column=1, row=1, ipadx=10, ipady=10, sticky="NSEW")

        rectangle_4 = Label(self, text="Rectangle 4", bg="pink", fg="white")
        rectangle_4.grid(column=0, row=1, ipadx=10, ipady=10, sticky="NSEW")
        
        # On ajoute un titre à la fenêtre
        self.title("Eye Tracker")
       



# On crée notre fenêtre et on l'affiche
window = MyWindow()
window.mainloop()