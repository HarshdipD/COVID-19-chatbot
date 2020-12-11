/**************************************************
                  COVID-19 Chatbot
        Created by Harshdip Singh for COMP4400
**************************************************/

/*
 symptoms of COVID - source: Google
*/
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
* Responses - valid responses a user can type
*/
valid_response('yes').
valid_response('Yes').
valid_response('yup').
valid_response('Yup').
valid_response('no').
valid_response('No').
valid_response('nope').
valid_response('Nope').

positive_response('Yes').
positive_response('yes').
positive_response('yup').
positive_response('Yup').

valid_menu_option(1).
valid_menu_option(2).
valid_menu_option(3).
valid_menu_option(4).
valid_menu_option(5).
valid_menu_option(6).

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
* Main function to run the program
*/
run_bot :-
    writeln("\n********************************************"),
    writeln("       Welcome to COVID-19 Chatbot."),
    writeln("********************************************"),
    writeln("This is an experimental chatbot to give you useful advice for COVID-19, and check if your symptoms indicate possible virus contact."),
    writeln("Created by - Harshdip Singh Deogan for COMP4400"),
    writeln("NOTE: Please make sure to add a period (.) after any input you type."),
    display_menu.


/*
* Display user menu
* Input: Integers to select menu options
*/
display_menu :-
    writeln("\n\n"),
    writeln("What would you like to do? Type a number from this list: \n"),
    writeln("1. Show COVID-19 Symptoms    2. Enter a symptom to check if you have COVID-19"),
    writeln("3. Quarantine advice         4. Should I get tested?"),
    writeln("5. Vaccine info              6. Exit\n"),
    catch(
        (
            read(Menu_input),
            (
                valid_menu_option(Menu_input)
                -> (
                switch(Menu_input, [
                        1 : (
                            show_covid_symptoms,
                            display_menu
                        ),
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
                            sleep(0.2),
                            writeln("Exiting... Don\'t forget to practice safe distancing and wear a mask!!!"),
                            sleep(0.5)
                        )
                    ])
                )
                ; (
                    sleep(0.5),
                    writeln("Sorry, I didn\'t recognize that response. Let\'s try again..."),
                    sleep(1),
                    display_menu
                )
            )
        ),
        _,
        (
            writeln("Looks like you wrote something weird...let\'s try again..."),
            sleep(0.5),
            display_menu
        )
    ).

show_covid_symptoms :- 
    writeln("cant you just google it wtf").

/*
* Lets a user type out symptoms and indicate whether they match known COVID-19 symptoms
*/
check_if_covid :-
    sleep(0.5),
    writeln("Type out a symptom..."),
    catch(
        (
            read(Input),
            (
                symptom(Input)
                -> (
                    writeln("According to WHO, this symptom can indicate possible contact with the COVID-19 virus."),
                    sleep(0.5),
                    writeln("\nYou should quarantine immediately. I encourage you to type 1 again to check if you have any other symptoms. Otherwise, type 2 to return to main menu."),
                    read(NextInput),
                    (
                        NextInput = 1
                        -> check_if_covid
                        ; (
                            writeln("Returning to main menu..."),
                            sleep(1)
                        )
                    )
                )
                ; (
                    writeln("Hmm..."),
                    sleep(1),
                    writeln("This is not a known COVID-19 symptom as of yet.\n"),
                    sleep(1),
                    writeln("If you think you made a typo or would like to try again with another symptom, type 1, otherwise type 2 to quit to main menu.\n"),
                    read(NextInput),
                    (
                        NextInput = 1
                        -> check_if_covid
                        ; (
                            writeln("Returning to main menu..."),
                            sleep(1)
                        )
                    )
                )
            )
        ),
        covid_quarantine_advice,
        (
            writeln("Wait... I think you\'re trying to type something with space in it."),
            sleep(1),
            writeln("Can you try to type out your symptom with single quotes (\') around it? Example: \'running nose\'"),
            sleep(1),
            check_if_covid
        )
    ).

covid_quarantine_advice :-
    writeln("The Government of Canada has put out detailed information regarding COVID-19."),
    writeln("Are you recently arriving in Canada from abroad?"),
    catch(
        (
            read(Travel),
            (
                valid_response(Travel)
                -> (
                    positive_response(Travel)
                    -> (
                        writeln("The Government of Canada has put in place emergency measures to slow the introduction and spread of COVID-19 in Canada. You MUST QUARANTINE for 14 days, provide contact information and monitor yourself for signs and symptoms as required by the Minimizing the Risk of Exposure to COVID-19 in Canada Order (Mandatory Isolation)."),
                        writeln(" You are encouraged to read more information at https://www.canada.ca/en/public-health/services/publications/diseases-conditions/2019-novel-coronavirus-information-sheet.html")
                    )
                    ; (
                        writeln("Okay, then you should follow the general advice, try to stay indoors and only go outside with proper protection!"),
                        writeln("Returning to main menu..."),
                        sleep(1.5)
                    )
                )
                ; (
                    writeln("Sorry, I didn\'t recognize that response. Let\'s try again."),
                    sleep(0.4),
                    covid_quarantine_advice
                )
            )
        ),
        _
        ,
        (
            writeln("Looks like you entered something weird by mistake... let\'s try again... (sorry)"),
            sleep(1),
            covid_quarantine_advice
        )
    ).
    
/*
* Performs a brief Q&A to decide whether a user should get tested immediately or not
*/
covid_testing_advice :-
    writeln("I can help you decide if you are wondering if you should get tested for COVID-19."),
    sleep(0.8),
    writeln("Those having symptoms of COVID-19 should separate from others and get tested as soon as possible."),
    sleep(0.8),
    writeln("Do your symptoms indicate that you might have COVID? (yes/no)"),
    catch(
        (
            read(Symptom),
            (
                valid_response(Symptom)
                -> (
                    positive_response(Symptom)
                    -> (
                        sleep(0.3),
                        writeln("\nYou should get tested as soon as possible. Make sure to practice safe distancing and quarentine immediately on any doubt!"),
                        sleep(1),
                        writeln("Returning to main menu..."),
                        sleep(1)
                    )
                    ; (
                        writeln("Have you been in close contact with a COVID positive person? (yes/no)"),
                        read(Contact),
                        (
                            positive_response(Contact)
                            -> (
                                writeln("You should get tested and quarantine as soon as possible."),
                                sleep(0.5),
                                writeln("Returning to main menu..."),
                                sleep(1)
                            )
                            ; (
                                writeln("Looks like there isn\'t a immediate need to get tested."),
                                sleep(1),
                                writeln("However, if you still think you should get tested, please do it. Make sure to practice safe distancing and quarentine immediately on any doubt!"),
                                writeln("Returning to main menu..."),
                                sleep(1)
                            )
                        )
                    )
                )
                ; (
                    writeln("Sorry, I didn\'t recognize that input. Let\'s try again..."),
                    sleep(0.5),
                    covid_testing_advice
                )
            )
        ),
        _,
        (
            writeln("Looks like you entered something weird by mistake... let\'s try again... (sorry)"),
            sleep(1),
            covid_testing_advice   
        )
    ).

covid_vaccine_info :-
    writeln("Different organizations are actively working on creating and testing new vaccines for COVID-19. There is no universally accepted vaccine as of yet."),
    sleep(1).
