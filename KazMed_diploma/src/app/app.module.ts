import { NgModule, Provider } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import {MainPageModule} from "./main-page/main-page.module";
import {ShairedModule} from "./shaired/shaired.module";
import {BrowserAnimationsModule} from "@angular/platform-browser/animations";
import { RouterModule } from '@angular/router';
import {HttpClientModule, HTTP_INTERCEPTORS} from "@angular/common/http";
import { ServicePageComponent } from './service-page/service-component/service-page.component';

import {MatSelectModule} from '@angular/material/select';

import { DisplayShowComponentComponent } from './service-page/display-show-component/display-show-component.component';

import { AuthInterceptor } from './AuthInterceptor';

const INTERCEPTOR_PROVIDER: Provider = {
  provide: HTTP_INTERCEPTORS,
  multi: true,
  useClass: AuthInterceptor
}

@NgModule({
  declarations: [
    AppComponent,
    ServicePageComponent,
    DisplayShowComponentComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    MainPageModule,
    ShairedModule,
    BrowserAnimationsModule,
    RouterModule,
    HttpClientModule,
    MatSelectModule,
  ],
  providers: [INTERCEPTOR_PROVIDER],
  bootstrap: [AppComponent]
})
export class AppModule { }
