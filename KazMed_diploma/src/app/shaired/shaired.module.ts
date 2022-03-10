import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {NavigationBarComponent} from "./navigation-bar/navigation-bar.component";
import {SignInComponent} from "./sign-in/sign-in.component";
import {SignUpComponent} from "./sign-up/sign-up.component";
import {MatDialogModule} from "@angular/material/dialog";
import { FooterComponent } from './footer/footer.component';
import {RouterModule} from "@angular/router";
import {ReactiveFormsModule} from "@angular/forms";



@NgModule({
  declarations: [
    NavigationBarComponent,
    SignInComponent,
    SignUpComponent,
    FooterComponent
  ],
  exports: [
    NavigationBarComponent,
    SignInComponent,
    SignUpComponent,
    FooterComponent
  ],
  imports: [
    CommonModule,
    MatDialogModule,
    RouterModule,
    ReactiveFormsModule


  ]
})
export class ShairedModule { }
