# 3160Lab3
Grade calculator built with yacc

Maybe my greatest frustration at this point is that I haven't found time to get more comfortable with github. That is a Spring Break project for me!

This grade caclculator accomplished my core goals for this lab, if not all the ones I speculated, or necessarily in the best possible implementation. It does:
1. Add up subtotals following a letter (r,q,l). I have it working only for three scores at the moment.
2. In response to 't', it shows subtotals again and then returns total.
3. I added the possibility to correct here. Should an error be spotted or change to a score desired, entering the appropriate letter and three new scores will overwrite the subtotal for that category.
4. 'x' works to reset all subtotals to zero so that a new set of scores may be added. 
(Screenshot of a sample session follows.)

I feel as though this was potentially a bit of a cheat in that I worked mostly by creating if statements inside the brackets of c-code in the yacc file. (And I left the calc.l file untouched here for honesty's sake: though I did moneky around with it to experiment with a number of things I wound up not really changing its function in the calculator so I went all the way back to the original for clarity.)

Goals I set I did not meet were getting the Polish Notation Calculator example from gnu.org to work with the lexer separated out. I got close, but an error remained and so I switched to the Class Calculator example as a working model to modify. I also did not add any file saving functions as I imagined I might.

What I would do next, given time, is take a step back with the better understanding of yacc instructions I have now, and redesign the whole thing with the yacc and lex tools in mind, rather than sort of shoehorning it into the calculator as I have. I began to sketch this change for myself today and realized I would not be able to finish it in time.

Sample session:
<img src="blob:chrome-untrusted://media-app/765bf14e-1c3e-4dac-a2b7-646123c6acdf" alt="Screenshot 2021-03-24 8.10.51 PM.png"/>![image](https://user-images.githubusercontent.com/78714090/112404135-28cfb600-8ce6-11eb-9809-40e6faca7b78.png)
