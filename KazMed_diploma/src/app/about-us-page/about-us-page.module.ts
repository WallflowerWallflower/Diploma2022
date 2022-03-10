import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AboutUsPageRoutingModule } from './about-us-page-routing.module';
import { AboutUsComponent } from './about-us/about-us.component';
import {MainPageModule} from "../main-page/main-page.module";


@NgModule({
  declarations: [
    AboutUsComponent
  ],
  imports: [
    CommonModule,
    AboutUsPageRoutingModule,
    MainPageModule
  ]
})
export class AboutUsPageModule { }
