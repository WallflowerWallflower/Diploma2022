import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';


import { ServicePageComponent } from './service-component/service-page.component';
import { MedcenterPageRoutingModule } from './service-page-routing.module';
import { HttpClientModule } from '@angular/common/http';
import { BrowserModule } from '@angular/platform-browser';


@NgModule({
  declarations: [
    ServicePageComponent
  ],
  imports: [
    CommonModule,
    BrowserModule,
    MedcenterPageRoutingModule,
    HttpClientModule
  ]
})
export class ServicePageModule { }
