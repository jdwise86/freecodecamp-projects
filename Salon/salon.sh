#!/bin/bash

# Define the PSQL variable for database connection
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

# Display the welcome message
echo -e "\n~~~~~ MY SALON ~~~~~\n"

# Function to display the main menu
MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "Welcome to My Salon, how can I help you?"

  # Fetch the list of services from the database
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
  
  # Display the services
  echo "$SERVICES" | while IFS="|" read SERVICE_ID NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
    # Prompt user for service selection
  read SERVICE_ID_SELECTED
    # Validate input (only allow 1-5) 
    if ! [[ "$SERVICE_ID_SELECTED" =~ ^[1-5]$ ]]
    then
      # send to main menu
      MAIN_MENU "I could not find that service. What would you like today?"
    else
    # get customer info
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
    #get service name
        SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
    # Check if customer exists
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # if customer doesn't exist
        if [[ -z $CUSTOMER_NAME ]]
        then
          # get new customer name
          echo -e "\nI don't have a record for that phone number, what's your name?"
          read CUSTOMER_NAME
        # insert new customer
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
        fi
      # get customer_id
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      # display customer names
        echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?"
        read SERVICE_TIME
        # Insert appointment
        INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
        echo -e "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

# Call the main menu function
MAIN_MENU
