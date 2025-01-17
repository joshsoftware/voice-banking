ACTION_EXTRATOR_PROMPT = """
<USER_COMMAND>

Above is the command given by a banking app user.
Goal here is to convert this command into an actionable JSON object.

Following is the list of action we support.

[
    {
        "action": "money_transfer",
        "data": {
            "amount": "",
            "recipient": ""
        }
    },
    {
        "action": "account_balance_check",
        "data": {
            
        }
    },
    {
        "action": "loan_emi_check",
        "data": {
            
        }
    }
]

Check if the given command aligns to one of the actions listed above, if yes then give the JSON object with relevant data added in the 'data' param, if no then response back with 'unsupported' as action and put the actual user command as data.

Please note, not all commands need any information in data, only put data when it's supporting the action (like in case of money_transfer the amount and recipient are necessary details, but nothing is needed in case of account_balance_check)

Important: You must return only the JSON object. Do not add any explanations, headers, or other text outside the JSON object. If you include anything outside of the JSON, the response will be considered invalid.
Do not prefix or suffix the response with anything like "Here is the result."

"""