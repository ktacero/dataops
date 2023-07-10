## Proyecto de DataOps: Descripción de alto nivel

### Introduccion sobre herramientas

#### GitLab
GitLab es una plataforma de gestión de repositorios de código fuente y de colaboración en el desarrollo de software. Proporciona un entorno completo para el ciclo de vida de desarrollo, desde el control de versiones con Git hasta la integración continua (CI) y la implementación continua (CD). GitLab incluye características como seguimiento de problemas, gestión de proyectos, wikis, paneles de control y muchas otras herramientas que facilitan la colaboración y la entrega de software de manera efectiva.

GitLab ofrece diferentes opciones de instalación, dependiendo de tus necesidades:

- [GitLab Self-Managed](https://about.gitlab.com/install/) - Si deseas instalar y administrar GitLab en tus propios servidores.
- [GitLab.com](https://about.gitlab.com/) - Si prefieres utilizar GitLab como un servicio alojado en la nube.


#### Docker
Docker es una plataforma de virtualización a nivel de sistema operativo que permite a los desarrolladores empacar y distribuir aplicaciones en contenedores. Un contenedor de Docker incluye todo lo necesario para ejecutar una aplicación, incluidas las bibliotecas, las dependencias y el código. Al utilizar Docker, se facilita la creación, implementación y ejecución de aplicaciones en diferentes entornos de manera consistente, lo que aumenta la portabilidad y la eficiencia.

Puedes descargar Docker desde el [sitio web oficial de Docker](https://www.docker.com/products) de acuerdo a tu sistema operativo.

- [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop) - Para usuarios de Windows.
- [Docker Desktop for Mac](https://www.docker.com/products/docker-desktop) - Para usuarios de macOS.
- [Docker Engine](https://docs.docker.com/engine/install/) - Para usuarios de distribuciones de Linux específicas.


#### Terraform
Terraform es una herramienta de infraestructura como código (IaC) que permite la creación y administración de infraestructuras de forma automatizada y declarativa. Con Terraform, los desarrolladores y los equipos de operaciones pueden definir su infraestructura como código utilizando un lenguaje de configuración sencillo. Terraform se encarga de provisionar y gestionar recursos en diferentes proveedores de nube, como Amazon Web Services (AWS), Microsoft Azure, Google Cloud Platform (GCP) y muchos otros. Esto simplifica la implementación y el mantenimiento de la infraestructura, al tiempo que proporciona una mayor visibilidad y control sobre los recursos utilizados en el entorno de desarrollo y producción.

Puedes descargar Terraform desde el [sitio web oficial de HashiCorp](https://www.terraform.io/downloads.html). Selecciona tu sistema operativo y descarga la última versión estable de Terraform.

### Poc

Como construir el proyecto:

terraform init 
terraform apply 
yes



