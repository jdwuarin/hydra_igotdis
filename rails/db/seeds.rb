
# so that I can easily just FactoryGirl.create the stuff I want.
require 'factory_girl'

# Now here is the data that I would like to have in the db
# for the LWC_Worldcup

# first we FactoryGirl.create the tournament
tournament = FactoryGirl.create(:LWC_tournament)

# then add all the teams that will participate

# Group A
team_1 = FactoryGirl.create(:LWC_ahq)

ahq = FactoryGirl.create(:tournament_contestant,
             tournament: tournament,
             contestant: team_1,
             group_id: Groups::GROUP_A)

team_2 = FactoryGirl.create(:LWC_samsung_galaxy_white)

samsung_galaxy_white = FactoryGirl.create(:tournament_contestant,
                              tournament: tournament,
                              contestant: team_2,
                              group_id: Groups::GROUP_A)

team_3 = FactoryGirl.create(:team, name: "Edward Gaming",
                logo: "teams/edward_gaming_logo.png")

edward_gaming = FactoryGirl.create(:tournament_contestant,
                       tournament: tournament,
                       contestant: team_3,
                       group_id: Groups::GROUP_A)

team_4 = FactoryGirl.create(:team, name: "Dark Passage",
                logo: "teams/dark_passage_logo.png")

dark_passage = FactoryGirl.create(:tournament_contestant,
                      tournament: tournament,
                      contestant: team_4,
                      group_id: Groups::GROUP_A)

# Group B

team_5 = FactoryGirl.create(:team, name: "Star Horn",
                logo: "teams/star_horn_logo.png")

star_horn = FactoryGirl.create(:tournament_contestant,
                   tournament: tournament,
                   contestant: team_5,
                   group_id: Groups::GROUP_B)

team_6 = FactoryGirl.create(:team, name: "Team SoloMid",
                logo: "teams/team_solomid_logo.png")

team_solomid = FactoryGirl.create(:tournament_contestant,
                      tournament: tournament,
                      contestant: team_6,
                      group_id: Groups::GROUP_B)

team_7 = FactoryGirl.create(:team, name: "Taipei Assassins",
                logo: "teams/taipei_assassins_logo.png")

taipei_assassins = FactoryGirl.create(:tournament_contestant,
                          tournament: tournament,
                          contestant: team_7,
                          group_id: Groups::GROUP_B)

team_8 = FactoryGirl.create(:team, name: "SK Gaming",
                logo: "teams/sk_logo.png")

sk = FactoryGirl.create(:tournament_contestant,
            tournament: tournament,
            contestant: team_8,
            group_id: Groups::GROUP_B)

# Group C

team_9 = FactoryGirl.create(:team, name: "LMQ",
                logo: "teams/lmq_logo.png")

lmq = FactoryGirl.create(:tournament_contestant,
             tournament: tournament,
             contestant: team_9,
             group_id: Groups::GROUP_C)

team_10 = FactoryGirl.create(:team, name: "OMG",
                logo: "teams/omg_logo.png")

omg = FactoryGirl.create(:tournament_contestant,
             tournament: tournament,
             contestant: team_10,
             group_id: Groups::GROUP_C)

team_11 = FactoryGirl.create(:team, name: "Fnatic",
                logo: "teams/fnatic_logo.png")

fnatic = FactoryGirl.create(:tournament_contestant,
                tournament: tournament,
                contestant: team_11,
                group_id: Groups::GROUP_C)

team_12 = FactoryGirl.create(:team, name: "Samsung Blue",
                logo: "teams/samsung_galaxy_blue_logo.png")

samsung_galaxy_blue = FactoryGirl.create(:tournament_contestant,
                             tournament: tournament,
                             contestant: team_12,
                             group_id: Groups::GROUP_C)

# Group D

team_13 = FactoryGirl.create(:team, name: "KaBuM!",
                logo: "teams/kabum_logo.png")

kabum = FactoryGirl.create(:tournament_contestant,
               tournament: tournament,
               contestant: team_13,
               group_id: Groups::GROUP_D)

team_14 = FactoryGirl.create(:team, name: "Najin Shield",
                logo: "teams/najin_white_shield_logo.png")

najin_white_shield = FactoryGirl.create(:tournament_contestant,
                            tournament: tournament,
                            contestant: team_14,
                            group_id: Groups::GROUP_D)

team_15 = FactoryGirl.create(:team, name: "Cloud9",
                logo: "teams/cloud9_logo.png")

cloud9 = FactoryGirl.create(:tournament_contestant,
                tournament: tournament,
                contestant: team_15,
                group_id: Groups::GROUP_D)

team_16 = FactoryGirl.create(:team, name: "Alliance",
                logo: "teams/alliance_logo.png")

alliance = FactoryGirl.create(:tournament_contestant,
                  tournament: tournament,
                  contestant: team_16,
                  group_id: Groups::GROUP_D)


# then the rounds associated with the tournament and the teams.

# only creating the group stage one for now, as We don't know who's
# in the quarters yet.
group_stage_round = FactoryGirl.create(:LWC_group_stage,
                                       tournament: tournament)

# so here are the matches

# Group matches

# Groups A and B matches day 1

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 18, 11).change(:offset => "+0200"),
       receiving_contestant: edward_gaming,
       invited_contestant: samsung_galaxy_white)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 18, 12).change(:offset => "+0200"),
       receiving_contestant: team_solomid,
       invited_contestant: sk)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 18, 13).change(:offset => "+0200"),
       receiving_contestant: dark_passage,
       invited_contestant: ahq)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 18, 14).change(:offset => "+0200"),
       receiving_contestant: taipei_assassins,
       invited_contestant: star_horn)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 18, 15).change(:offset => "+0200"),
       receiving_contestant: samsung_galaxy_white,
       invited_contestant: ahq)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 18, 16).change(:offset => "+0200"),
       receiving_contestant: star_horn,
       invited_contestant: team_solomid)

# Groups A and B matches day 2

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 19, 11).change(:offset => "+0200"),
       receiving_contestant: taipei_assassins,
       invited_contestant: sk)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 19, 12).change(:offset => "+0200"),
       receiving_contestant: edward_gaming,
       invited_contestant: dark_passage)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 19, 13).change(:offset => "+0200"),
       receiving_contestant: star_horn,
       invited_contestant: sk)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 19, 14).change(:offset => "+0200"),
       receiving_contestant: dark_passage,
       invited_contestant: samsung_galaxy_white)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 19, 15).change(:offset => "+0200"),
       receiving_contestant: team_solomid,
       invited_contestant: taipei_assassins)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 19, 16).change(:offset => "+0200"),
       receiving_contestant: edward_gaming,
       invited_contestant: ahq)

# Groups A and B matches day 3

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 20, 11).change(:offset => "+0200"),
       receiving_contestant: samsung_galaxy_white,
       invited_contestant: dark_passage)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 20, 12).change(:offset => "+0200"),
       receiving_contestant: sk,
       invited_contestant: star_horn)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 20, 13).change(:offset => "+0200"),
       receiving_contestant: ahq,
       invited_contestant: samsung_galaxy_white)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 20, 14).change(:offset => "+0200"),
       receiving_contestant: taipei_assassins,
       invited_contestant: team_solomid)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 20, 15).change(:offset => "+0200"),
       receiving_contestant: dark_passage,
       invited_contestant: edward_gaming)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 20, 16).change(:offset => "+0200"),
       receiving_contestant: sk,
       invited_contestant: taipei_assassins)

# Groups A and B matches day 4

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 21, 11).change(:offset => "+0200"),
       receiving_contestant: team_solomid,
       invited_contestant: star_horn)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 21, 12).change(:offset => "+0200"),
       receiving_contestant: ahq,
       invited_contestant: dark_passage)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 21, 13).change(:offset => "+0200"),
       receiving_contestant: star_horn,
       invited_contestant: taipei_assassins)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 21, 14).change(:offset => "+0200"),
       receiving_contestant: ahq,
       invited_contestant: edward_gaming)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 21, 15).change(:offset => "+0200"),
       receiving_contestant: sk,
       invited_contestant: team_solomid)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 21, 16).change(:offset => "+0200"),
       receiving_contestant: samsung_galaxy_white,
       invited_contestant: edward_gaming)


# Groups C and D matches day 1

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 25, 11).change(:offset => "+0200"),
       receiving_contestant: lmq,
       invited_contestant: omg)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 25, 12).change(:offset => "+0200"),
       receiving_contestant: najin_white_shield,
       invited_contestant: kabum)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 25, 13).change(:offset => "+0200"),
       receiving_contestant: samsung_galaxy_blue,
       invited_contestant: omg)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 25, 14).change(:offset => "+0200"),
       receiving_contestant: cloud9,
       invited_contestant: alliance)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 25, 15).change(:offset => "+0200"),
       receiving_contestant: fnatic,
       invited_contestant: lmq)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 25, 16).change(:offset => "+0200"),
       receiving_contestant: cloud9,
       invited_contestant: kabum)

# Groups C and D matches day 2

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 26, 11).change(:offset => "+0200"),
       receiving_contestant: najin_white_shield,
       invited_contestant: alliance)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 26, 12).change(:offset => "+0200"),
       receiving_contestant: samsung_galaxy_blue,
       invited_contestant: fnatic)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 26, 13).change(:offset => "+0200"),
       receiving_contestant: najin_white_shield,
       invited_contestant: cloud9)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 26, 14).change(:offset => "+0200"),
       receiving_contestant: omg,
       invited_contestant: fnatic)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 26, 15).change(:offset => "+0200"),
       receiving_contestant: alliance,
       invited_contestant: kabum)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 26, 16).change(:offset => "+0200"),
       receiving_contestant: samsung_galaxy_blue,
       invited_contestant: lmq)

# Groups C and D matches day 3

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 27, 8).change(:offset => "+0200"),
       receiving_contestant: fnatic,
       invited_contestant: omg)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 27, 9).change(:offset => "+0200"),
       receiving_contestant: alliance,
       invited_contestant: cloud9)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 27, 10).change(:offset => "+0200"),
       receiving_contestant: lmq,
       invited_contestant: fnatic)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 27, 11).change(:offset => "+0200"),
       receiving_contestant: kabum,
       invited_contestant: najin_white_shield)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 27, 12).change(:offset => "+0200"),
       receiving_contestant: omg,
       invited_contestant: samsung_galaxy_blue)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 27, 13).change(:offset => "+0200"),
       receiving_contestant: alliance,
       invited_contestant: najin_white_shield)

# Groups C and D matches day 4

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 28, 8).change(:offset => "+0200"),
       receiving_contestant: kabum,
       invited_contestant: cloud9)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 28, 9).change(:offset => "+0200"),
       receiving_contestant: lmq,
       invited_contestant: samsung_galaxy_blue)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 28, 10).change(:offset => "+0200"),
       receiving_contestant: kabum,
       invited_contestant: alliance)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 28, 11).change(:offset => "+0200"),
       receiving_contestant: fnatic,
       invited_contestant: samsung_galaxy_blue)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 28, 12).change(:offset => "+0200"),
       receiving_contestant: cloud9,
       invited_contestant: najin_white_shield)

FactoryGirl.create(:LWC_group_stage_match,
       round: group_stage_round,
       date: DateTime.new(2014, 9, 28, 13).change(:offset => "+0200"),
       receiving_contestant: omg,
       invited_contestant: lmq)

quarter_final_round = FactoryGirl.create(:LWC_quarter_final,
                                         tournament: tournament)

# for the quarter finals. This is just the main info
# adding them properly will require a lot of attention and not
# fucking it up. Do it when very concentrated


# quarter_final_round = Round.find_by(round_type: 2)

# samsung_galaxy_white = TournamentContestant.joins(:team).where(teams: {name: "Samsung White"})[0]
# team_solomid = TournamentContestant.joins(:team).where(teams: {name: "Team SoloMid"})[0]

# samsung_galaxy_blue = TournamentContestant.joins(:team).where(teams: {name: "Samsung Blue"})[0]
# cloud9 = TournamentContestant.joins(:team).where(teams: {name: "Cloud9"})[0]

# star_horn = TournamentContestant.joins(:team).where(teams: {name: "Star Horn"})[0]
# edward_gaming = TournamentContestant.joins(:team).where(teams: {name: "Edward Gaming"})[0]

# najin_white_shield = TournamentContestant.joins(:team).where(teams: {name: "Najin Shield"})[0]
# omg = TournamentContestant.joins(:team).where(teams: {name: "OMG"})[0]


# FactoryGirl.create(:LWC_quarter_final_match,
#        round: quarter_final_round,
#        date: DateTime.new(2014, 10, 3, 9).change(:offset => "+0200"),
#        receiving_contestant: samsung_galaxy_white,
#        invited_contestant: team_solomid)

# FactoryGirl.create(:LWC_quarter_final_match,
#        round: quarter_final_round,
#        date: DateTime.new(2014, 10, 4, 6).change(:offset => "+0200"),
#        receiving_contestant: samsung_galaxy_blue,
#        invited_contestant: cloud9)

# FactoryGirl.create(:LWC_quarter_final_match,
#        round: quarter_final_round,
#        date: DateTime.new(2014, 10, 5, 6).change(:offset => "+0200"),
#        receiving_contestant: star_horn,
#        invited_contestant: edward_gaming)

# FactoryGirl.create(:LWC_quarter_final_match,
#        round: quarter_final_round,
#        date: DateTime.new(2014, 10, 6, 9).change(:offset => "+0200"),
#        receiving_contestant: najin_white_shield,
#        invited_contestant: omg)

semi_final_round = FactoryGirl.create(:LWC_semi_final,
                                      tournament: tournament)

# semi_final_round = Round.find(3)

# samsung_galaxy_white = TournamentContestant.joins(:team).where(teams: {name: "Samsung White"})[0]
# samsung_galaxy_blue = TournamentContestant.joins(:team).where(teams: {name: "Samsung Blue"})[0]

# star_horn = TournamentContestant.joins(:team).where(teams: {name: "Star Horn"})[0]
# omg = TournamentContestant.joins(:team).where(teams: {name: "OMG"})[0]

# FactoryGirl.create(:LWC_semi_final_match,
#        round: semi_final_round,
#        date: DateTime.new(2014, 10, 11, 9).change(:offset => "+0200"),
#        receiving_contestant: samsung_galaxy_white,
#        invited_contestant: samsung_galaxy_blue)

# FactoryGirl.create(:LWC_semi_final_match,
#        round: semi_final_round,
#        date: DateTime.new(2014, 10, 12, 9).change(:offset => "+0200"),
#        receiving_contestant: star_horn,
#        invited_contestant: omg)

final_round = FactoryGirl.create(:LWC_final,
                                 tournament: tournament)

# final_round = Round.find(4)

# samsung_galaxy_white = TournamentContestant.joins(:team).where(teams: {name: "Samsung White"})[0]
# star_horn = TournamentContestant.joins(:team).where(teams: {name: "Star Horn"})[0]

# FactoryGirl.create(:LWC_final_match,
#        round: final_round,
#        date: DateTime.new(2014, 10, 19, 7).change(:offset => "+0200"),
#        receiving_contestant: samsung_galaxy_white,
#        invited_contestant: star_horn)

