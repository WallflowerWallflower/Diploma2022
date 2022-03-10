import { Component, OnInit } from '@angular/core';
import {MatDialog} from "@angular/material/dialog";
import {SignUpComponent} from "../../shaired/sign-up/sign-up.component";
import {AuthService} from "../../auth.service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  constructor(private dialog: MatDialog, private auth: AuthService, private router: Router) { }

  ngOnInit(): void {
  }

  signUp(){
    this.dialog.open(SignUpComponent, {
      width: '500px'
    });
  }

  check(){
    if(!this.auth.checkNav()){
      this.router.navigate(['../doctors']);
    } else {
      alert("Please login");
    }
  }

}
