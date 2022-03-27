import { Injectable } from '@angular/core';
import {Router} from "@angular/router";
import {RequestService} from "./request.service";
import {SignInComponent} from "./shaired/sign-in/sign-in.component";
import {MatDialog} from "@angular/material/dialog";
import { catchError, Observable, Subject, tap, throwError } from 'rxjs';
import { FBAuthResponse } from 'src/environments/interface';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { environment } from 'src/environments/environment';

export interface User {
  email: string
  password: string
  returnSecureToken?: boolean
}
@Injectable({
  providedIn: 'root'
})
export class AuthService {

  public error$: Subject<string> = new Subject<string>();

  private URL = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=';

  constructor(
    private router: Router,
    private service: RequestService,
    private http: HttpClient
    ) {}

  get token(): any {
    const dateNow = new Date();
    const expDate = localStorage.getItem('fb-token-exp')!;
    if(dateNow.toString() > expDate) {
      this.logout();
      return null
    }
    return localStorage.getItem('fb-token');
  }

  userEmail(): Observable<any> {
    return this.http.get(`https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${environment.apiKey}`)
  }

  login(user: User): Observable<any> {
    user.returnSecureToken = true;
    return this.http.post(`https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${environment.apiKey}`, user)
      .pipe(
        tap(this.setToken),
        catchError(this.handleError.bind(this))
      )
  }

  logout() {
    this.setToken(null);
    this.router.navigate(['/home']);
  }

  isAuthenticated(): boolean {
    return !!this.token
  }

  private handleError(error: HttpErrorResponse): any {

    const INVALID_EMAIL = 'INVALID_EMAIL';
    const INVALID_PASSWORD = 'INVALID_PASSWORD';
    const EMAIL_NOT_FOUND = 'EMAIL_NOT_FOUND';

    const { message } = error.error.error;

    switch(message) {
      case INVALID_EMAIL:
        this.error$.next("WRONG EMAIL: Please correct your email!");
        break;
      case INVALID_PASSWORD:
        this.error$.next("WRONG PASSWORD: Enter correct password")
        break;
      case EMAIL_NOT_FOUND:
        this.error$.next("EMAIL NOT FOUND: This email does not exist!");
        break;
    }

    return throwError(() => error);
  }

  private setToken(response: FBAuthResponse | any | null) {
    if(response) {
      const exp = new Date(new Date().getTime() + +response.expiresIn * 1000)
      localStorage.setItem('fb-token', response.idToken)
      localStorage.setItem('fb-token-exp', exp.toString());
    } else {
      localStorage.clear();
    }
  }
}
