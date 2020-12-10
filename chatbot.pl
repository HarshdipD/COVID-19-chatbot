# symptoms of COVID - source: Google
symptom('fever').
symptom('dry cough').
symptom('tiredness').
symptom('aches').
symptom('pain').
symptom('diarrhoea').
symptom('conjunctivitis').
symptom('headache').
symptom('loss of taste or smell').
symptom('rashes').
symptom('difficulty breathing').
symptom('shortness of breath').
symptom('chest pain').
symptom('loss of speech').

/*
  Switch statement definition
  For easier usability of the display_menu function
  Source - https://stackoverflow.com/questions/35764778/switch-statements-in-prolog
*/
switch(X, [Val:Goal|Cases]) :-
    ( X=Val ->
        call(Goal)
    ;
        switch(X, Cases)
    ).

/*
Main function to run the program
*/
run_bot :-
    writeln("\n********************************************"),
    writeln("       Welcome to COVID-19 Chatbot."),
    writeln("********************************************"),
    writeln("This is an experimental chatbot to give you useful advice for COVID, and check if your symptoms indicate possible virus contact."),
    writeln("Created by - Harshdip Singh Deogan for COMP4400"),
    writeln("NOTE: Please make sure to add an period (.) after any input you type."),
    display_menu.


/*
* Display user menu
* Input: Integers to select menu options
*/
display_menu :-
    writeln("\n\n"),
    writeln("What would you like to do? Type a number from this list: \n"),
    writeln("1. Show COVID-19 Symptoms    2. Enter a symptom to check if you have COVID-19"),
    writeln("3. Quarantine advice         4. Testing advice"),
    writeln("5. Vaccine info              6. Exit\n"),
    read(Menu_input),
    switch(Menu_input, [
        1 : writeln("lol"),
        2 : (
            check_if_covid,
            display_menu
        ),
        3 : (
            covid_quarantine_advice,
            display_menu
        ),
        4 : (
            covid_testing_advice,
            display_menu
        ),
        5 : (
            covid_vaccine_info,
            display_menu
        ),
        6 : (
            writeln("Exiting... Don\'t forget to practice safe distancing and wear a mask!!!")
        )
    ]).

check_if_covid :-
    writeln("Type out a symptom..."),
    read(Input),
    (
        symptom(Input)
        -> (
            writeln("According to WHO, this symptom can indicate possible contact with the COVID-19 virus."),
            writeln("You should quarantine immediately. I encourage you to type 1 again to check if you have any other symptoms. Otherwise, type 2 to return to main menu."),
            read(NextInput),
            (
                NextInput = 1
                -> check_if_covid
                ; writeln("Returning to main menu...")
            )
        )
        ; (
            writeln("This is not a known COVID-19 symptom as of yet.\n"),
            writeln("If you think you made a typo or would like to try again with another symptom, type 1, otherwise type 2 to quit to main menu.\n"),
            read(NextInput),
            (
                NextInput = 1
                -> check_if_covid
                ; writeln("Returning to main menu...")
            )
        )
    ).

covid_quarantine_advice :-
    writeln("lol stay home what else").

covid_testing_advice :-
    writeln("I can help you decide if you are wondering if you should get tested for COVID-19."),
    writeln("Those having symptoms of COVID-19 should separate from others and get tested as soon as possible."),
    writeln("Have you checked your symptoms and if they indicate that you might have COVID? (yes/no)"),
    read(Symptom),
    (
        Symptom = yes
        -> (
            writeln("You should get tested as soon as possible. Make sure to practice safe distancing and quarentine immediately on any doubt!"),
            writeln("Returning to main menu...")
        )
        ; (
            writeln("Have you been in close contact with a COVID positive person? (yes/no)"),
            read(Contact),
            (
                Contact = yes
                -> writeln("You should get tested and quarantine as soon as possible.")
                ; (
                    writeln("Looks like there isn\'t a immediate need to get tested."),
                    writeln("However, if you still think you should get tested, please do it. Make sure to practice safe distancing and quarentine immediately on any doubt!"),
                    writeln("Returning to main menu...")
                )
            )
        )
    ).

covid_vaccine_info :-
    writeln("lmao").

    
