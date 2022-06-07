import { Component, OnInit } from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {DataService} from "../data.service";
import {HttpService} from "../http.service";

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.scss']
})
export class MainComponent implements OnInit {
  users: any;
  constructor(public http:HttpClient, public hs: HttpService) { }

  ngOnInit(): void {
    this.hs.getAllUser().subscribe(console.log)
    let body ={
      username: "shynggys000@gmail.com",
      password: "aaaa"
    }
    this.http.request('POST', 'https://0d26-176-64-0-150.eu.ngrok.io/auth-service/auth', {
        headers: {
          'Accept': '*/*',
          'Access-Control-Allow-Origin': '*/*'
        },
        body: body,
        observe: 'response'
      }
    ).subscribe(res=>{
      console.log(res.headers.get('authorization'))
    })
    // const body = {
    //   customerName: "Ayan1",
    //   customerSurname: "Surname1",
    //   customerTelNumber: "7075558899",
    //   email: "a.nurinvest@gmail.com",
    //   username: "Ayan1",
    //   password: "222222",
    //   address: "st. address",
    //   roles: [
    //     "ADMIN"
    //   ]
    // }
    // this.http.post('http://4d93-176-64-11-229.eu.ngrok.io/auth-service/registration/add-customer', body).subscribe(data=>{
    //   console.log(data)
    //
    // })
  }
}


