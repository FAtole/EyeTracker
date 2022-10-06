import tkinter as tk

class Widget_info(object):
    
    def __init__(self, widget, text='widget info'):
        self.temps_avant_affichage = 500     #miliseconds
        self.Largeur_info = 250   #pixels
        self.widget = widget
        self.text = text
        self.widget.bind("<Enter>", self.entrer)
        self.widget.bind("<Leave>", self.sortir)
        self.widget.bind("<ButtonPress>", self.sortir)
        self.id = None
        self.tw = None

    def entrer(self, event=None):
        self.attente_affichage()

    def sortir(self, event=None):
        self.fin_attente_affichage()
        self.cacher_info()

    def attente_affichage(self):
        self.fin_attente_affichage()
        self.id = self.widget.after(self.temps_avant_affichage, self.afficher_info)

    def fin_attente_affichage(self):
        id = self.id
        self.id = None
        if id:
            self.widget.after_cancel(id)

    def afficher_info(self, event=None):
        x = y = 0
        x, y, cx, cy = self.widget.bbox("insert")
        x += self.widget.winfo_rootx() + 25
        y += self.widget.winfo_rooty() + 20
        # creates a toplevel window
        self.tw = tk.Toplevel(self.widget)
        # Leaves only the label and removes the app window
        self.tw.wm_overrideredirect(True)
        self.tw.wm_geometry("+%d+%d" % (x, y))
        label = tk.Label(self.tw, text=self.text, justify='left',
        background="#ffffff", relief='solid', borderwidth=1,
        wraplength = self.Largeur_info)
        label.pack(ipadx=1)

    def cacher_info(self):
        tw = self.tw
        self.tw= None
        if tw:
            tw.destroy()


"""# testing ...
if __name__ == '__main__':
    root = tk.Tk()
    btn1 = tk.Button(root, text="button 1")
    btn1.pack(padx=10, pady=5)
    button1_ttp = Widget_info(btn1, "Question : Comment vas-tu ? \n Reponses :\n\tBien\n\tFatigué ")
    btn2 = tk.Button(root, text="button 2")
    btn2.pack(padx=10, pady=5)
    button2_ttp = Widget_info(btn2, \
    "First thing's first, I'm the realest. Drop this and let the whole world "
    "feel it. And I'm still in the Murda Bizness. I could hold you down, like "
    "I'm givin' lessons in  physics. You should want a bad Vic like this.")
    root.mainloop()"""