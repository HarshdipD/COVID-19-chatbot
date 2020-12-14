# COVID-19-chatbot

 A chatbot made in Prolog that helps you identify if you have possibly contracted COVID. 
 This project has been created for the COMP4400 course at UWindsor.
 
## Try this chatbot 
### Prerequisites
You need to have prolog installed on your device.
### Command to run
You can directly run this command on your terminal to run this program:
```
swipl -s chatbot.pl -g "run_bot." -t halt.
```

Alternatively, you can open Prolog with `swipl`, load the file by typing `[chatbot].` and then run the main function by typing `run_bot.`
The above command does all this for you.
 
## Features
This chatbot, while seemingly basic in a fellow developer's eyes, packs a lot of intelligence and gives good information for an end user. 
 - Catch Errors - It can understand wrong input and handle it without exiting the program.
 - User can:
   - Enter a symptom and see if that is a recognized COVID-19 symptom
   - Seek quarantine advice
   - Know when they should get tested
   - Vaccine updates
 - Friendly menu to select above mentioned features
 - Uses sleep() functions to fake computing speed and make it easier to read the information available
 - Easy and brief Q&As to provide specific advice instead of dumping all the information and let the user know for themselves what they want


## How it works
This is a very simple yet powerful terminal chatbot with a lot of potential for further expansion.
The source code can be found at `chatbot.pl`.

### Symptoms detection
I have created a compact database of all the known symptoms of COVID-19. When a user enters a symptom, it searches through that database and lets a user know if something matches. 
* This can be further improved to lowercase all input to match case sensitive input.

### Menu
Menu is made with a switch statement. It is recursive, so that user doesn't just exists the program after using it one time. 

### Q&As 
Instead of dumping all the information, I have made sure to ask appropriate questions regarding each problem and only provide those specific answers. I also handle input all the time and try to fix it if there is any wrong input accidentally (or on purpose).

## Future scope
This is a very simple yet powerful terminal chatbot with a lot of potential for further expansion.
It may look like an easy task for an experienced developer, but for an end user, this is not less than an actual computing AI-driven chat bot.
We can add more things like:
 - Let user exit to menu anytime during a Q&A
 - Add more updated information on vaccine everytime there is a new update
 - Find a way to pull information through web scraping so not everything is hardcoded and need to be updated through code
 - Try to handle input, such as spelling mistakes and try to match that
 - Add a function that shows all COVID-19 symptoms at once
 
 
#### Thank you for checking out my project!

