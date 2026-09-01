import duckdb
from rich.console import Console
from rich.panel import Panel
from rich.text import Text

console = Console()

con = duckdb.connect("sql_murder_mystery.duckdb")

pista_inicial = con.execute("""
    SELECT description
    FROM crime_scene_report
    WHERE city = 'SQL City' AND type = 'murder' AND date = 20180115;
""").fetchone()


if pista_inicial:
    pista = pista_inicial[0]
    texto_pista = Text(pista, style="bold white")

    console.print()
    console.print(
        Panel(
            texto_pista,
            title="[bold red]🕵️‍♂️ PISTA PRINCIPAL DE LA POLICÍA[/bold red]",
            subtitle="[dim]Fecha: 15 de Enero, 2018 | Ciudad: SQL City[/dim]",
            border_style="red",
            padding=(1, 2),
        )
    )
else:
    console.print("[bold yellow]No se encontraron registros.[/bold yellow]")


# Investigando a los testigos

person = con.execute("""
    SELECT *
    FROM person
    LIMIT 10
""").df()

interview = con.execute("""
    SELECT *
    FROM interview
    LIMIT 10
""").df()

testigo2 = con.execute("""
    SELECT p.id, i.transcript
    FROM person AS p INNER JOIN interview AS i ON p.id = i.person_id
    WHERE p.name LIKE '%Annabel%' AND p.address_street_name LIKE '%Franklin Ave%'
""").df()

print(f"{testigo2.iloc[0]['id']} Annabel: {testigo2.iloc[0]['transcript']}")

gym = con.execute("""
    SELECT m.person_id, p.name, c.check_in_date, m.membership_status
    FROM person AS p INNER JOIN get_fit_now_member AS m ON p.id = m.person_id
    INNER JOIN get_fit_now_check_in AS c ON m.id = c.membership_id
    WHERE c.check_in_date = '20180109' AND m.membership_status = 'gold'
""").df()

print(gym)

declaraciones = con.execute("""
    SELECT person_id, transcript
    FROM interview
    WHERE person_id IN (28819, 55662, 67318, 83186, 92736)
""").df()

print(f"{declaraciones.iloc[1]['person_id']}: {declaraciones.iloc[1]['transcript']}")


mente_maestra = con.execute("""
    SELECT p.id, p.name
    FROM facebook_event_checkin as f
    INNER JOIN person as p ON(f.person_id = p.id)
    INNER JOIN drivers_license as dl ON (p.license_id = dl.id)
    WHERE gender = 'female' AND event_name = 'SQL Symphony Concert' AND hair_color = 'red'
    AND car_make = 'Tesla'
    GROUP BY p.id, p.name
""").df()

print(mente_maestra)

con.close()
