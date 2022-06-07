import { Component, OnInit } from '@angular/core';
import {AngularFireAuth} from "@angular/fire/compat/auth";
import {Router} from "@angular/router";

@Component({
  selector: 'app-admin-page',
  templateUrl: './admin-page.component.html',
  styleUrls: ['./admin-page.component.scss']
})
export class AdminPageComponent implements OnInit {

  constructor(public auth: AngularFireAuth, private route: Router) { }

  ngOnInit(): void {
  }
  logOut(){
    this.auth.signOut();
    this.route.navigate(['login_page'])
  }
}
