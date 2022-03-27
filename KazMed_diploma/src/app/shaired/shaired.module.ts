import { NgModule, Provider } from '@angular/core';
import { CommonModule } from '@angular/common';
import {NavigationBarComponent} from "./navigation-bar/navigation-bar.component";
import {SignInComponent} from "./sign-in/sign-in.component";
import {SignUpComponent} from "./sign-up/sign-up.component";
import {MatDialogModule} from "@angular/material/dialog";
import { FooterComponent } from './footer/footer.component';
import {RouterModule} from "@angular/router";
import {ReactiveFormsModule} from "@angular/forms";

import { TuiNotificationModule, TUI_NOTIFICATION_DEFAULT_OPTIONS,
  TUI_NOTIFICATION_OPTIONS,
  TuiNotification, } from "@taiga-ui/core";

const NOTIFICATIONS_OPTIONS: Provider = {
  provide: TUI_NOTIFICATION_OPTIONS,
  useValue: {
    ...TUI_NOTIFICATION_DEFAULT_OPTIONS,
    status: TuiNotification.Error,
    hasIcon: true,
  }
}

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
    ReactiveFormsModule,
    TuiNotificationModule
  ],
  providers: [NOTIFICATIONS_OPTIONS]
})
export class ShairedModule { }
