import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MedcenterPageRoutingModule } from './medcenter-page-routing.module';
import { ListOfMedcenterComponent } from './list-of-medcenter/list-of-medcenter.component';
import {MainPageModule} from "../main-page/main-page.module";


@NgModule({
  declarations: [
    ListOfMedcenterComponent
  ],
  imports: [
    CommonModule,
    MedcenterPageRoutingModule,
    MainPageModule
  ]
})
export class MedcenterPageModule { }
