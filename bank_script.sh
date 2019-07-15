#!/bin/bash
curl --header "Content-Type: application/json" -d "{\"username\":\"donyyalbert.com\",\"password\":\"adin\"}" https://bank-server-detail.herokuapp.com/api/user/register 
echo ""
curl --header "Content-Type: application/json" -d "{\"username\":\"donny@alb.com\",\"password\":\"adin\"}" https://bank-server-detail.herokuapp.com/api/user/register 
echo ""
curl --header "Content-Type: application/json" -d "{\"username\":\"donny@alb.com\",\"password\":\"adin\"}" https://bank-server-detail.herokuapp.com/api/user/register 
echo ""
curl --header "Content-Type: application/json" -d "{\"username\":\"donyyalbert.com\",\"password\":\"adin\"}" https://bank-server-detail.herokuapp.com/api/user/login 
echo ""
curl --header "Content-Type: application/json" -d "{\"username\":\"donny@albert.com\",\"password\":\"adino\"}" https://bank-server-detail.herokuapp.com/api/user/login 
echo ""
curl --header "Content-Type: application/json" -d "{\"username\":\"donny@albert.com\",\"password\":\"adin\"}" https://bank-server-detail.herokuapp.com/api/user/login 
echo ""
curl --header "Content-Type: application/json" -d "{\"ifsc\":\"ABHY0065001\"}" https://bank-server-detail.herokuapp.com/api/bank/allbanks 
echo ""
curl --header "Content-Type: application/json" --header "auth-token:this-is-an-invalid-token" -d "{\"ifsc\":\"ABHY0065001\"}" https://bank-server-detail.herokuapp.com/api/bank/allbanks 
echo ""
curl --header "Content-Type: application/json" --header "auth-token:eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOjgsInVzZXJuYW1lIjoidGFpQGRzZC5jb20iLCJpYXQiOjE1NjMwMzU5MDEsImV4cCI6MTU2MzQ2NzkwMX0.lP3Ad5oNwn7yl2wlbhWhVw8SbgaKK6_fy1xBwZYzda8" -d "{\"ifsc\":\"ABHY0065001\"}" https://bank-server-detail.herokuapp.com/api/bank/allbanks
echo ""
curl --header "Content-Type: application/json" --header "auth-token:eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOjgsInVzZXJuYW1lIjoidGFpQGRzZC5jb20iLCJpYXQiOjE1NjMwMzU5MDEsImV4cCI6MTU2MzQ2NzkwMX0.lP3Ad5oNwn7yl2wlbhWhVw8SbgaKK6_fy1xBwZYzda8" -d "{\"ifsc\":\"ABHY0065001\"}" 'https://bank-server-detail.herokuapp.com/api/bank/allbanks/?offset=0&limit=1' 
echo ""
curl --header "Content-Type: application/json" -d "{\"city\":\"MUMBAI\",\"bank_name\":\"ABHYUDAYA COOPERATIVE BANK LIMITED\"}" https://bank-server-detail.herokuapp.com/api/bank/allbranches 
echo ""
curl --header "Content-Type: application/json" --header "auth-token:this_is_an_invalid_token" -d "{\"city\":\"MUMBAI\",\"bank_name\":\"ABHYUDAYA COOPERATIVE BANK LIMITED\"}" https://bank-server-detail.herokuapp.com/api/bank/allbranches 
echo ""
curl --header "Content-Type: application/json" --header "auth-token:eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOjgsInVzZXJuYW1lIjoidGFpQGRzZC5jb20iLCJpYXQiOjE1NjMwMzU5MDEsImV4cCI6MTU2MzQ2NzkwMX0.lP3Ad5oNwn7yl2wlbhWhVw8SbgaKK6_fy1xBwZYzda8" -d "{\"city\":\"MUMBAI\",\"bank_name\":\"ABHYUDAYA COOPERATIVE BANK LIMITED\"}" 'https://bank-server-detail.herokuapp.com/api/bank/allbranches' 
echo ""
curl --header "Content-Type: application/json" --header "auth-token:eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOjgsInVzZXJuYW1lIjoidGFpQGRzZC5jb20iLCJpYXQiOjE1NjMwMzU5MDEsImV4cCI6MTU2MzQ2NzkwMX0.lP3Ad5oNwn7yl2wlbhWhVw8SbgaKK6_fy1xBwZYzda8" -d "{\"city\":\"MUMBAI\",\"bank_name\":\"ABHYUDAYA COOPERATIVE BANK LIMITED\"}" 'https://bank-server-detail.herokuapp.com/api/bank/allbranches/?offset=5&limit=3' 
echo ""
