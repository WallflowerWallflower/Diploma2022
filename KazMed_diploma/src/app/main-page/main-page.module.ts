import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatDialogModule } from '@angular/material/dialog';
import { MainPageRoutingModule } from './main-page-routing.module';
import { HomeComponent } from './home/home.component';


@NgModule({
  declarations: [
    HomeComponent,
  ],
  exports: [
    HomeComponent,
  ],
  imports: [
    CommonModule,
    MainPageRoutingModule,
    MatDialogModule
  ]
})
export class MainPageModule { }
