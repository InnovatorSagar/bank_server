# bank_server <br/>
#API to create user <br/>
#table users have fields (username,password) <br/>
CURL SCRIPTS : <br/>
<br/><br/>
#To create User:
<br/>
#invalid email
<br/>1. curl --header "Content-Type: application/json" -d "{\\"username\\":\\"donyyalbert.com\\",\\"password\\":\\"adin\\"}" https://bank-server-detail.herokuapp.com/api/user/register
<br/>->Response : {"message":"\"username\" must be a valid email"}
<br/>
<br/>
#Fair credentials
<br/>2. curl --header "Content-Type: application/json" -d "{\\"username\\":\\"donny@albert.com\\",\\"password\\":\\"adin\\"}" https://bank-server-detail.herokuapp.com/api/user/register
<br/> -> Response : "User created"
<br/>
<br/>
#Again trying with same credentials
<br/>3. curl --header "Content-Type: application/json" -d "{\\"username\\":\\"donny@albert.com\\",\\"password\\":\\"adin\\"}" https://bank-server-detail.herokuapp.com/api/user/register
<br/>-> Response : {"message":"User already exists"}
<br/>
<br/>
#To login and generate Token
<br/>#invalid email
<br/>1. curl --header "Content-Type: application/json" -d "{\\"username\\":\\"donyyalbert.com\\",\\"password\\":\\"adin\\"}" https://bank-server-detail.herokuapp.com/api/user/login
<br/>-> Response: {"message":"\"username\" must be a valid email"}
<br/>
<br/>#Giving correct username but wrong password
<br/>2. curl --header "Content-Type: application/json" -d "{\\"username\\":\\"donny@albert.com\\",\\"password\\":\\"adino\\"}" https://bank-server-detail.herokuapp.com/api/user/login
<br/>-> Response: "Wrong password"
<br/>
<br/>
#Correct credentials 
<br/>3. curl --header "Content-Type: application/json" -d "{\\"username\\":\\"donny@albert.com\\",\\"password\\":\\"adin\\"}" https://bank-server-detail.herokuapp.com/api/user/login
<br/>-> Response: "Token present in header as auth-token" 
<br/>##in header as "auth-token" 
<br/><br/>
#To get all bank details using IFSC code
<br/>#Without token
<br/>1. curl --header "Content-Type: application/json" -d "{\\"ifsc\\":\\"ABHY0065001\\"}" https://bank-server-detail.herokuapp.com/api/bank/allbanks
<br/>Response-> Acess Denied, Please login first!
<br/><br/>
#Modified Token
<br/>2. curl --header "Content-Type: application/json" --header "auth-token:this-is-an-invalid-token" -d "{\\"ifsc\\":\\"ABHY0065001\\"}" https://bank-server-detail.herokuapp.com/api/bank/allbanks
<br/>Response-> Invalid token
<br/><br/>
#Correct Token
<br/>3. curl --header "Content-Type: application/json" --header "auth-token:eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOjgsInVzZXJuYW1lIjoidGFpQGRzZC5jb20iLCJpYXQiOjE1NjMwMzU5MDEsImV4cCI6MTU2MzQ2NzkwMX0.lP3Ad5oNwn7yl2wlbhWhVw8SbgaKK6_fy1xBwZYzda8" -d "{\\"ifsc\\":\\"ABHY0065001\\"}" https://bank-server-detail.herokuapp.com/api/bank/allbanks
<br/>Response-> [{"ifsc":"ABHY0065001","bank_id":"60","branch":"RTGS-HO","address":"ABHYUDAYA BANK BLDG., B.NO.71, NEHRU NAGAR, KURLA (E), MUMBAI-400024","city":"MUMBAI","district":"GREATER MUMBAI","state":"MAHARASHTRA","name":"ABHYUDAYA COOPERATIVE BANK LIMITED","id":"60"}]
<br/><br/>
#demonstrating OFFSET and LIMIT
<br/>4. curl --header "Content-Type: application/json" --header "auth-token:eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOjgsInVzZXJuYW1lIjoidGFpQGRzZC5jb20iLCJpYXQiOjE1NjMwMzU5MDEsImV4cCI6MTU2MzQ2NzkwMX0.lP3Ad5oNwn7yl2wlbhWhVw8SbgaKK6_fy1xBwZYzda8" -d "{\\"ifsc\\":\\"ABHY0065001\\"}" 'https://bank-server-detail.herokuapp.com/api/bank/allbanks/?offset=0&limit=1'
<br/>Response-> [
    {
        "ifsc": "ABHY0065001",
        "bank_id": "60",
        "branch": "RTGS-HO",
        "address": "ABHYUDAYA BANK BLDG., B.NO.71, NEHRU NAGAR, KURLA (E), MUMBAI-400024",
        "city": "MUMBAI",
        "district": "GREATER MUMBAI",
        "state": "MAHARASHTRA",
        "name": "ABHYUDAYA COOPERATIVE BANK LIMITED",
        "id": "60"
    }
]
<br/><br/>
#To get all branch details using IFSC code
<br/>#Without token
<br/>1. curl --header "Content-Type: application/json" -d "{\\"city\\":\\"MUMBAI\\",\\"bank_name\\":\\"ABHYUDAYA COOPERATIVE BANK LIMITED\\"}" https://bank-server-detail.herokuapp.com/api/bank/allbranches
<br/>Response-> Acess Denied, Please login first!
<br/><br/>
#Modified Token
<br/>2. curl --header "Content-Type: application/json" --header "auth-token:this_is_an_invalid_token" -d "{\\"city\\":\\"MUMBAI\\",\\"bank_name\\":\\"ABHYUDAYA COOPERATIVE BANK LIMITED\\"}" https://bank-server-detail.herokuapp.com/api/bank/allbranches
<br/>Response-> Invalid token
<br/><br/>
#Correct Token
<br/>3. curl --header "Content-Type: application/json" --header "auth-token:eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOjgsInVzZXJuYW1lIjoidGFpQGRzZC5jb20iLCJpYXQiOjE1NjMwMzU5MDEsImV4cCI6MTU2MzQ2NzkwMX0.lP3Ad5oNwn7yl2wlbhWhVw8SbgaKK6_fy1xBwZYzda8" -d "{\\"city\\":\\"MUMBAI\\",\\"bank_name\\":\\"ABHYUDAYA COOPERATIVE BANK LIMITED\\"}" 'https://bank-server-detail.herokuapp.com/api/bank/allbranches'
<br/>Response-> #array of bank and branch details, can't paste here as the results very large. We will see how limit and offset will be used to solve this
<br/><br/>
#demonstrating OFFSET and LIMIT
<br/>4. curl --header "Content-Type: application/json" --header "auth-token:eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOjgsInVzZXJuYW1lIjoidGFpQGRzZC5jb20iLCJpYXQiOjE1NjMwMzU5MDEsImV4cCI6MTU2MzQ2NzkwMX0.lP3Ad5oNwn7yl2wlbhWhVw8SbgaKK6_fy1xBwZYzda8" -d "{\\"city\\":\\"MUMBAI\\",\\"bank_name\\":\\"ABHYUDAYA COOPERATIVE BANK LIMITED\\"}" 'https://bank-server-detail.herokuapp.com/api/bank/allbranches/?offset=5&limit=3'
<br/>Response-> [
    {
        "ifsc": "ABHY0065006",
        "bank_id": "60",
        "branch": "FORT",
        "address": "ABHYUDAYA BANK BLDG., 251, PERIN NARIMAN STREET, FORT, MUMBAI-400001",
        "city": "MUMBAI",
        "district": "GREATER MUMBAI",
        "state": "MAHARASHTRA",
        "bank_name": "ABHYUDAYA COOPERATIVE BANK LIMITED"
    },
    {
        "ifsc": "ABHY0065007",
        "bank_id": "60",
        "branch": "GHATKOPAR",
        "address": "UNIT NO 2 & 3, SILVER HARMONY BLDG,NEW MANIKLAL ESTATE, GHATKOPAR (WEST), MUMBAI-400086",
        "city": "MUMBAI",
        "district": "GREATER MUMBAI",
        "state": "MAHARASHTRA",
        "bank_name": "ABHYUDAYA COOPERATIVE BANK LIMITED"
    },
    {
        "ifsc": "ABHY0065008",
        "bank_id": "60",
        "branch": "KANJUR",
        "address": "BHANDARI CO-OP. HSG. SOCIETY, KANJUR VILLAGE, KANJUR (EAST), MUMBAI-400078",
        "city": "MUMBAI",
        "district": "GREATER MUMBAI",
        "state": "MAHARASHTRA",
        "bank_name": "ABHYUDAYA COOPERATIVE BANK LIMITED"
    }
]
