# Requirements Engineering Notizen
## Warum Requirements Engineering?
Stakeholder

- specification
- requirements elicitation (Formular, Sprache etc)

Shared understanding

Development Team


## Arten von Requirements
Functional Requirements

- Functions: Input-Storage-Output
- Usage: Process, Scenario
- Domain: Data, Behaviour

Non-Functional Requirements

- Quality Requirement
- Constraint: an imposed design decision

Interfaces

- Machine-to-Machine Interface
- Graphical User Interface

Other

- Product: A Software thtat is offered for use. A product usually has multiple features.
- Feature: A set of requirements that re implemented together and fulfil a goal.

## Stakeholder
### stakeholder
```
A stakeholder of a system is a persion or organization that has a direct or inidrect influence on the requirements of system.
```
### Viewpoints
```
A viewpoint is a stakeholder, system, (business) process, standard (or other binding document), importatn event, or other entity that has a direct or indirect influence on the requirements of the system. Each non-human viewpoint is owned by a stakeholder.
```

3 aspects characterzie a viewpoint:

- Type of influence: direct or indirect
- Strenght of influence (=power): impatct of saying "no" to out system
- Direction and strength of interest (=attitude): can we gain attention for our system


## Onion Model
```

	--add image made on 29.9 on htc8
	(Irrelevant enviroment [regulation, audit]
		(indirect viewpoint [Kirurk; Chef Krankenschwester, Product manager]     ->
			(direct viewpoint []    ->
				(system [Entwicklungs-Team] dimension:{Managment; regulation; support; })
			)    
		)     
	)

```

## Requirements
### Woher kommen die Anforderungen (Beispiel Diabetes app)
- Patietnen
	- Umfragen
	- Interviews
	- Workshops
- Arzt
	- Interviews
	- Umfragen
	- Workshops
- Privacy, Umgang mit Daten
	- Jurist / Anwalt
	- Dokumentanalyse
- Smarte / Utensilien
	- Empfohlene Standarts
	- Hersteller nachfragen
- Richtlinien für Mobilplattform
	- Entwickler Seiten der Plattform
- App
	- App Store
- Domain-Wissen
	- Erfahrungsberichte
	- Wikipedia
	- Wissenschaftliche Puplikationen
- Teilweise reuse alte requirements

## Unterschied Interview und Workshops
In Workshop bespricht man gleichzeitig mit mehreren Arbeiten und debatieren, wogegen man bei Interviews nur eine Person befragt. Bei Interviews kann man viel tiefer einen spezialisten Fragen, da die anderen nicht warten müssen.

## Mini-Projekt
### Killer features
