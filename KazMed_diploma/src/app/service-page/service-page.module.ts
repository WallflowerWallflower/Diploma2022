import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';


import { ServicePageComponent } from './service-component/service-page.component';
import { MedcenterPageRoutingModule } from './service-page-routing.module';
import { HttpClientModule } from '@angular/common/http';
import { BrowserModule } from '@angular/platform-browser';
import { DisplayShowComponentComponent } from './display-show-component/display-show-component.component';


@NgModule({
  declarations: [
    ServicePageComponent,
  ],
  imports: [
    CommonModule,
    BrowserModule,
    MedcenterPageRoutingModule,
    HttpClientModule
  ]
})
export class ServicePageModule { }
