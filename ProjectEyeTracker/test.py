import tkinter as tk

root = tk.Tk()

chLabel = tk.Label(root, text="Channel group")
channelButtons = tk.Frame(root, bg='yellow')
ch1Button = tk.Button(channelButtons, text="CH1 Settings")
ch1Button.pack(fill='x')
ch2Button = tk.Button(channelButtons, text="CH2 Settings")
ch2Button.pack(fill='x')
ch3Button = tk.Button(channelButtons, text="CH3 Settings")
ch3Button.pack(fill='x')
ch4Button = tk.Button(channelButtons, text="CH4 Settings")
ch4Button.pack(fill='x')

trigLabel = tk.Label(root, text="Trigger group")
trigButton = tk.Button(root, text="Trigger Settings")

horizLabel = tk.Label(root, text="Horizontal group")
horizButton = tk.Button(root, text="Horizontal settings")

# Align the labels and buttons in a 2-by-3 grid
chLabel.grid(row=0, column=0, pady=10)
trigLabel.grid(row=0, column=1, pady=10)
horizLabel.grid(row=0, column=2, pady=10)
channelButtons.grid(row=1, column=0, sticky='news')
trigButton.grid(row=1, column=1, sticky='news')
horizButton.grid(row=1, column=2, sticky='news')

root.mainloop()