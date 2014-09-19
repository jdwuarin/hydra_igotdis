# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# so that I can easily just create the stuff I want.
require 'factory_girl_rails'

# Now here is the data that I would like to have in the db
# for the LWC_Worldcup

# first we create the tournament
tournament = create(:LWC_tournament)

# then add all the teams that will participate

# Group A
team_1 = create(:LWC_ahq)

ahq = create(:tournament_contestant,
             tournament: tournament,
             contestant: team_1,
             group_id: GROUP::GROUP_A)

team_2 = create(:LWC_samsung_galaxy_white)

samsung_galaxy_white = create(:tournament_contestant,
                              tournament: tournament,
                              contestant: team_2,
                              group_id: GROUP::GROUP_A)

team_3 = create(:team, name: "Edward Gaming",
                logo: "/assets/teams/edward_gaming_logo.png")

edward_gaming = create(:tournament_contestant,
                       tournament: tournament,
                       contestant: team_3,
                       group_id: GROUP::GROUP_A)

team_4 = create(:team, name: "Dark Passage",
                logo: "/assets/teams/dark_passage_logo.png")

dark_passage = create(:tournament_contestant,
                      tournament: tournament,
                      contestant: team_4,
                      group_id: GROUP::GROUP_A)

# Group B

team_5 = create(:team, name: "Star Horn Royal Club",
                logo: "/assets/teams/star_horn_logo.png")

star_horn = create(:tournament_contestant,
                   tournament: tournament,
                   contestant: team_5,
                   group_id: GROUP::GROUP_B)

team_6 = create(:team, name: "Team SoloMid",
                logo: "/assets/teams/team_solomid_logo.png")

team_solomid = create(:tournament_contestant,
                      tournament: tournament,
                      contestant: team_6,
                      group_id: GROUP::GROUP_B)

team_7 = create(:team, name: "Taipei Assassins",
                logo: "/assets/teams/taipei_assassins_logo.png")

taipei_assassins = create(:tournament_contestant,
                          tournament: tournament,
                          contestant: team_7,
                          group_id: GROUP::GROUP_B)

team_8 = create(:team, name: "SK Gaming",
                logo: "/assets/teams/sk_logo.png")

sk = create(:tournament_contestant,
            tournament: tournament,
            contestant: team_8,
            group_id: GROUP::GROUP_B)

# Group C

team_9 = create(:team, name: "LMQ",
                logo: "/assets/teams/lmq_logo.png")

lmq = create(:tournament_contestant,
             tournament: tournament,
             contestant: team_9,
             group_id: GROUP::GROUP_C)

team_10 = create(:team, name: "OMG",
                logo: "/assets/teams/omg_logo.png")

omg = create(:tournament_contestant,
             tournament: tournament,
             contestant: team_10,
             group_id: GROUP::GROUP_C)

team_11 = create(:team, name: "Fnatic",
                logo: "/assets/teams/fnatic_logo.png")

fnatic = create(:tournament_contestant,
                tournament: tournament,
                contestant: team_11,
                group_id: GROUP::GROUP_C)

team_12 = create(:team, name: "Samsung Galaxy Blue",
                logo: "/assets/teams/samsung_galaxy_blue_logo.png")

samsung_galaxy_blue = create(:tournament_contestant,
                             tournament: tournament,
                             contestant: team_12,
                             group_id: GROUP::GROUP_C)

# Group D

team_13 = create(:team, name: "KaBuM! a-Sports",
                logo: "/assets/teams/kabum_logo.png")

kabum = create(:tournament_contestant,
               tournament: tournament,
               contestant: team_13,
               group_id: GROUP::GROUP_D)

team_14 = create(:team, name: "NaJin White Shield",
                logo: "/assets/teams/najin_white_shield_logo.png")

najin_white_shield = create(:tournament_contestant,
                            tournament: tournament,
                            contestant: team_14,
                            group_id: GROUP::GROUP_D)

team_15 = create(:team, name: "Cloud9",
                logo: "/assets/teams/cloud9_logo.png")

cloud9 = create(:tournament_contestant,
                tournament: tournament,
                contestant: team_15,
                group_id: GROUP::GROUP_D)

team_16 = create(:team, name: "Alliance",
                logo: "/assets/teams/alliance_logo.png")

alliance = create(:tournament_contestant,
                  tournament: tournament,
                  contestant: team_16,
                  group_id: GROUP::GROUP_D)


# then the rounds associated with the tournament and the teams.

# only creating the group stage one for now, as We don't know who's
# in the quarters yet.
group_stage_round = create(:LWC_group_stage, tournament: tournament)


# so here are the matches

# Group matches

# Groups A and B matches day 1

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 18, 11).change(:offset => "+0200"),
       receiving_contestant: edward_gaming,
       invited_contestant: samsung_galaxy_white)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 18, 12).change(:offset => "+0200"),
       receiving_contestant: team_solomid,
       invited_contestant: sk)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 18, 13).change(:offset => "+0200"),
       receiving_contestant: dark_passage,
       invited_contestant: ahq)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 18, 14).change(:offset => "+0200"),
       receiving_contestant: taipei_assassins,
       invited_contestant: star_horn)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 18, 15).change(:offset => "+0200"),
       receiving_contestant: samsung_galaxy_white,
       invited_contestant: ahq)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 18, 16).change(:offset => "+0200"),
       receiving_contestant: star_horn,
       invited_contestant: team_solomid)

# Groups A and B matches day 2

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 19, 11).change(:offset => "+0200"),
       receiving_contestant: taipei_assassins,
       invited_contestant: sk)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 19, 12).change(:offset => "+0200"),
       receiving_contestant: edward_gaming,
       invited_contestant: dark_passage)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 19, 13).change(:offset => "+0200"),
       receiving_contestant: star_horn,
       invited_contestant: sk)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 19, 14).change(:offset => "+0200"),
       receiving_contestant: dark_passage,
       invited_contestant: samsung_galaxy_white)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 19, 15).change(:offset => "+0200"),
       receiving_contestant: team_solomid,
       invited_contestant: taipei_assassins)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 19, 16).change(:offset => "+0200"),
       receiving_contestant: edward_gaming,
       invited_contestant: ahq)

# Groups A and B matches day 3

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 20, 11).change(:offset => "+0200"),
       receiving_contestant: samsung_galaxy_white,
       invited_contestant: dark_passage)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 20, 12).change(:offset => "+0200"),
       receiving_contestant: sk,
       invited_contestant: star_horn)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 20, 13).change(:offset => "+0200"),
       receiving_contestant: ahq,
       invited_contestant: samsung_galaxy_white)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 20, 14).change(:offset => "+0200"),
       receiving_contestant: taipei_assassins,
       invited_contestant: team_solomid)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 20, 15).change(:offset => "+0200"),
       receiving_contestant: dark_passage,
       invited_contestant: edward_gaming)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 20, 16).change(:offset => "+0200"),
       receiving_contestant: sk,
       invited_contestant: taipei_assassins)

# Groups A and B matches day 4

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 21, 11).change(:offset => "+0200"),
       receiving_contestant: team_solomid,
       invited_contestant: star_horn)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 21, 12).change(:offset => "+0200"),
       receiving_contestant: ahq,
       invited_contestant: dark_passage)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 21, 13).change(:offset => "+0200"),
       receiving_contestant: star_horn,
       invited_contestant: taipei_assassins)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 21, 14).change(:offset => "+0200"),
       receiving_contestant: ahq,
       invited_contestant: edward_gaming)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 21, 15).change(:offset => "+0200"),
       receiving_contestant: sk,
       invited_contestant: team_solomid)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 21, 16).change(:offset => "+0200"),
       receiving_contestant: samsung_galaxy_white,
       invited_contestant: edward_gaming)


# Groups C and D matches day 1

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 25, 11).change(:offset => "+0200"),
       receiving_contestant: lmq,
       invited_contestant: omg)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 25, 12).change(:offset => "+0200"),
       receiving_contestant: najin_white_shield,
       invited_contestant: kabum)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 25, 13).change(:offset => "+0200"),
       receiving_contestant: samsung_galaxy_blue,
       invited_contestant: omg)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 25, 14).change(:offset => "+0200"),
       receiving_contestant: cloud9,
       invited_contestant: alliance)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 25, 15).change(:offset => "+0200"),
       receiving_contestant: fnatic,
       invited_contestant: lmq)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 25, 16).change(:offset => "+0200"),
       receiving_contestant: cloud9,
       invited_contestant: kabum)

# Groups C and D matches day 2

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 26, 11).change(:offset => "+0200"),
       receiving_contestant: najin_white_shield,
       invited_contestant: alliance)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 26, 12).change(:offset => "+0200"),
       receiving_contestant: samsung_galaxy_blue,
       invited_contestant: fnatic)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 26, 13).change(:offset => "+0200"),
       receiving_contestant: najin_white_shield,
       invited_contestant: cloud9)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 26, 14).change(:offset => "+0200"),
       receiving_contestant: omg,
       invited_contestant: fnatic)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 26, 15).change(:offset => "+0200"),
       receiving_contestant: alliance,
       invited_contestant: kabum)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 26, 16).change(:offset => "+0200"),
       receiving_contestant: samsung_galaxy_blue,
       invited_contestant: lmq)

# Groups C and D matches day 3

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 27, 8).change(:offset => "+0200"),
       receiving_contestant: fnatic,
       invited_contestant: omg)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 27, 9).change(:offset => "+0200"),
       receiving_contestant: alliance,
       invited_contestant: cloud9)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 27, 10).change(:offset => "+0200"),
       receiving_contestant: lmq,
       invited_contestant: fnatic)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 27, 11).change(:offset => "+0200"),
       receiving_contestant: kabum,
       invited_contestant: najin_white_shield)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 27, 12).change(:offset => "+0200"),
       receiving_contestant: omg,
       invited_contestant: samsung_galaxy_blue)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 27, 13).change(:offset => "+0200"),
       receiving_contestant: alliance,
       invited_contestant: najin_white_shield)

# Groups C and D matches day 4

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 28, 8).change(:offset => "+0200"),
       receiving_contestant: kabum,
       invited_contestant: cloud9)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 28, 9).change(:offset => "+0200"),
       receiving_contestant: lmq,
       invited_contestant: samsung_galaxy_blue)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 28, 10).change(:offset => "+0200"),
       receiving_contestant: kabum,
       invited_contestant: alliance)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 28, 11).change(:offset => "+0200"),
       receiving_contestant: fnatic,
       invited_contestant: samsung_galaxy_blue)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 28, 12).change(:offset => "+0200"),
       receiving_contestant: cloud9,
       invited_contestant: najin_white_shield)

create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 28, 13).change(:offset => "+0200"),
       receiving_contestant: omg,
       invited_contestant: lmq)





