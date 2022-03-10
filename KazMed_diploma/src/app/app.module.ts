import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import {MainPageModule} from "./main-page/main-page.module";
import {ShairedModule} from "./shaired/shaired.module";
import {BrowserAnimationsModule} from "@angular/platform-browser/animations";
import { RouterModule } from '@angular/router';
import {HttpClientModule} from "@angular/common/http";
import { ServicePageComponent } from './service-page/service-component/service-page.component';
@NgModule({
  declarations: [
    AppComponent,
    ServicePageComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    MainPageModule,
    ShairedModule,
    BrowserAnimationsModule,
    RouterModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
