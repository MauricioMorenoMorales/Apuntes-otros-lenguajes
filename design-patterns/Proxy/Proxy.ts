/**
 * The Subject interface declares common operations for both RealSubject and the
 * Proxy. As long as the client works with RealSubject using this interface,
 * you'll be able to pass it a proxy instead of a real subject.
 */
interface Subject {
  request(): void;
}

/**
* The RealSubject contains some core business logic. Usually, RealSubjects are
* capable of doing some useful work which may also be very slow or sensitive -
* e.g. correcting input data. A Proxy can solve these issues without any
* changes to the RealSubject's code.
*/
class RealSubject implements Subject {
  public request(): void {
      console.log('RealSubject: Handling request.');
  }
}

class Proxy implements Subject {
  private realSubject: RealSubject;

  constructor(realSubject: RealSubject) {
      this.realSubject = realSubject;
  }

  public request(): void {
      if (this.checkAccess()) {
          this.realSubject.request();
          this.logAccess();
      }
  }

  private checkAccess(): boolean {
      console.log('Proxy: Checking access prior to firing a real request.');

      return true;
  }

  private logAccess(): void {
      console.log('Proxy: Logging the time of request.');
  }
}

function clientCode__proxy(subject: Subject) {
  // ...

  subject.request();

  // ...
}

console.log('Client: Executing the client code with a real subject:');
const realSubject = new RealSubject();
clientCode__proxy(realSubject);

console.log('');

console.log('Client: Executing the same client code with a proxy:');
const proxy = new Proxy(realSubject);
clientCode__proxy(proxy);