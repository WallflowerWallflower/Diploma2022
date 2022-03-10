import { Component, OnInit } from '@angular/core';
import {SignInComponent} from "../sign-in/sign-in.component";
import {MatDialog} from "@angular/material/dialog";
import {SignUpComponent} from "../sign-up/sign-up.component";
import {AuthService} from "../../auth.service";

@Component({
  selector: 'app-navigation-bar',
  templateUrl: './navigation-bar.component.html',
  styleUrls: ['./navigation-bar.component.css']
})
export class NavigationBarComponent implements OnInit {

  isAuth = false;

  constructor(private dialog: MatDialog, private auth: AuthService) { }

  ngOnInit(): void {
  }

  login(): boolean{
    return this.auth.checkNav();
  }

  signIn(){
    this.dialog.open(SignInComponent, {
      width: '500px'
    });
  }

  exit(){
    this.auth.logout();
  }

  signUp(){
    this.dialog.open(SignUpComponent, {
      width: '500px'
    });
  }

}
