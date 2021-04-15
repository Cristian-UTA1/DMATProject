import os
import os.path
import shutil
import pandas as pd
WORKING_DIR = os.getcwd()

# Purpose: collect all data from .csv files into organized lists

MANUFACTURERS = ['BMW', 'Daimler', 'Ford MC', 'GM', 'Honda MC', 'Hyundai Kia', 'Mazda', 'Renault', 'Stellantis',
                 'Subaru', 'Tesla', 'Toyota MC', 'Volkswagen', 'Volvo']
BRANDS = ['Acura', 'Alfa Romeo', 'Audi', 'Bentley', 'BMW', 'Buick', 'Cadillac', 'Chevrolet', 'Chrysler', 'Dodge',
          'Fiat', 'Ford', 'Genesis', 'GMC', 'Honda', 'Hyundai', 'Infiniti', 'Jaguar', 'Jeep', 'Kia', 'Land Rover',
          'Lexus', 'Lincoln', 'Maserati', 'Mazda', 'Mercedes-Benz', 'Mini', 'Mitsubishi', 'Nissan', 'Porsche',
          'Ram', 'Smart', 'Subaru', 'Tesla', 'Toyota', 'Volkswagen', 'Volvo']

BMW         = ['BMW', 'BMW', 'Mini']
Daimler     = ['Daimler', 'Mercedes-Benz', 'Smart']
Ford_MC     = ['Ford', 'Ford', 'Lincoln']
GM          = ['GM', 'Buick', 'Cadillac', 'Chevrolet', 'GMC']
Honda_MC    = ['Honda MC', 'Acura', 'Honda']
Hyundai_Kia = ['Hyundai Kia', 'Genesis', 'Hyundai', 'Kia']
Mazda       = ['Mazda', 'Mazda']
Renault     = ['Renault', 'Infiniti', 'Mitsubishi', 'Nissan']
Stellantis  = ['Stellantis', 'Alfa Romeo', 'Chrysler', 'Dodge', 'Fiat', 'Jeep', 'Maserati', 'Ram'] # FCA = Stellantis
Subaru      = ['Subaru', 'Subaru']
Tesla       = ['Tesla', 'Tesla']
Toyota_MC   = ['Toyota MC', 'Lexus', 'Toyota']
Volkswagen  = ['Volkswagen', 'Audi', 'Bentley', 'Porsce', 'Volkswagen']
Volvo       = ['Volvo', 'Volvo']

MAN_AND_BRANDS = [BMW, Daimler, Ford_MC, GM, Honda_MC, Hyundai_Kia, Mazda, Renault, Stellantis, Subaru,
                  Tesla, Toyota_MC, Volkswagen, Volvo]

def retrieve_all_data():
    # GENERAL STATS
    MANUFACTURE_DATA = [] # In GeneralStats\\Manufacturers
    MODEL_YEARLY_DATA =[] # In TotalSales\\Model

    YEARLY_CAR_SALES_DATA = []       # In TotalSales\\Overall
    QUARTERLY_BRAND_SALES_DATA = []  # In TotalSales\\Overall
    QUARTERLY_MAN_SALES_DATA = []    # In TotalSales\\Overall

    os.chdir('..')
    os.chdir('Data\\CSVs\\GeneralStats\\Manufacturers')

    filename = "_AUTOMOTIVE_STATS_ - Man. Sales - "

    for w in MANUFACTURERS:
        _file_ = filename + w + ".csv"
        #print(_file_)
        #file = open(_file_, 'r')
        df = pd.read_csv(_file_)
        MANUFACTURE_DATA.append(df)
        #print(df)


    # print(ALL_DATA)
    x = MANUFACTURE_DATA[0].loc[0] # ALL_DATA[i].loc[a] --> i is manufacturer and a is the entire year
    y = x[0] # x[b] --> b is the month where b>0 --> 0 is the element that contains the year


    os.chdir('..')
    os.chdir('TotalSales\\Model')
    YEARS = ['19', '20']
    filename = "_AUTOMOTIVE_STATS_ - Total Sales By Model - "

    for y in YEARS:
        _file_ = filename + y + ".csv"
        df = pd.read_csv(_file_)
        MODEL_YEARLY_DATA.append(df)

    # MODEL_YEARLY_DATA[i].loc[a] | a --> the model index & i --> the year index

    os.chdir('..')
    os.chdir('Overall')


    file_name = "_AUTOMOTIVE_STATS_ - Total Car Sales.csv"
    _df_ = pd.read_csv(file_name)
    YEARLY_CAR_SALES_DATA.append(_df_)

    file_name = "_AUTOMOTIVE_STATS_ - Total Sales By Brand.csv"
    _df_ = pd.read_csv(file_name)
    QUARTERLY_BRAND_SALES_DATA.append(_df_)

    file_name = "_AUTOMOTIVE_STATS_ - Total Sales By Brand.csv"
    _df_ = pd.read_csv(file_name)
    QUARTERLY_MAN_SALES_DATA.append(_df_)
    """
    # If you wish, you can create a single list of all 3. just append all 3 lists to a separate list
    # --> OVERALL.append(YEARLY_CAR_SALES_DATA) ... OVERALL[i].loc[a] i index -> yearly, quarter brand, or quarter man
    #                                                                 a index -> year, brand name, or manufacture name
    """

    # ************************* INFECTIONS *************************

    os.chdir('..')
    os.chdir('..')
    os.chdir('..')
    os.chdir('DailyInfections')

    DAILY_INFECTIONS = []
    file_name = "Daily_C19_Infections - Data.csv"
    _df_ = pd.read_csv(file_name)
    DAILY_INFECTIONS.append(_df_)

    # **************************************************************



    # *********************** UNEMPLOYMENT *************************

    os.chdir('..')
    os.chdir('MonthlyUnemployment')

    MONTHLY_UNEMPLOYMENT = []
    file_name = "Monthly_Unemployment - BLS Data Series.csv"
    _df_ = pd.read_csv(file_name)
    MONTHLY_UNEMPLOYMENT.append(_df_)

    # **************************************************************



    # ************************ SEGMENT 2019 ************************
    _YEAR_ = ['Year2019', 'Year2020']
    _PASSENGER_TYPES_ = ['ALL', 'Large', 'Large Luxury', 'Midsize ALL', 'Midsize Hybrid Electric', 'Midsize Luxury',
                         'Small ALL', 'Small City', 'Small Compact', 'Small Luxury', 'Small Subcompact',
                         'Small Warm Hatchbacks', 'Sports']
    _SUV_TYPES_ = ['Small', 'Midsize', 'Large']
    _LABELS_ = ['P', 'S', 'T', 'M'] #

    PASSENGER_DATA = []
    SUV_DATA = []
    TRUCK_DATA = []
    MINIVAN_DATA = []

    os.chdir('..')
    os.chdir('SegmentData\\Year2019')
    os.chdir('Passenger') # GETTING PASSENGER DATA
    file_name = "Segment_Data_2019 - P - "

    for p in _PASSENGER_TYPES_:
        _file_ = file_name + p + ".csv"
        df = pd.read_csv(_file_)
        PASSENGER_DATA.append(df)

    os.chdir('..')
    os.chdir('SUVs') # GETTING SUV DATA
    file_name = "Segment_Data_2019 - S - "

    for s in _SUV_TYPES_:
        _file_ = file_name + s + ".csv"
        df = pd.read_csv(_file_)
        SUV_DATA.append(df)

    os.chdir('..')
    os.chdir('PickupTruck') # GETTING PICKUP TRUCK DATA
    file_name = "Segment_Data_2019 - T - ALL.csv"

    _df_ = pd.read_csv(file_name)
    TRUCK_DATA.append(_df_)

    # TODO: collect pickup truck data
    os.chdir('..')
    os.chdir('Minivan') # GETTING MINIVAN DATA
    file_name = "Segment_Data_2019 - M - Minivans.csv"

    _df_ = pd.read_csv(file_name)
    MINIVAN_DATA.append(_df_)
    # **************************************************************

    x = MINIVAN_DATA[0].loc[0] # x[i] when i>0, x[i] returns an integer
    print(MINIVAN_DATA)


    SEGMENT_2019_DATA = [PASSENGER_DATA, SUV_DATA, TRUCK_DATA, MINIVAN_DATA]
    del MINIVAN_DATA
    del TRUCK_DATA
    del SUV_DATA
    del PASSENGER_DATA
    del file_name
    del _df_

    # ************************ SEGMENT 2020 ************************

    PASSENGER_DATA = []
    SUV_DATA = []
    TRUCK_DATA = []
    MINIVAN_DATA = []

    os.chdir('..')
    os.chdir('..')
    print(os.getcwd())
    os.chdir('Year2020')
    os.chdir('Passenger') # GETTING PASSENGER DATA
    file_name = "Segment_Data_2020 - P - "

    for p in _PASSENGER_TYPES_:
        _file_ = file_name + p + ".csv"
        df = pd.read_csv(_file_)
        PASSENGER_DATA.append(df)

    os.chdir('..')
    os.chdir('SUVs') # GETTING SUV DATA
    file_name = "Segment_Data_2020 - S - "

    for s in _SUV_TYPES_:
        _file_ = file_name + s + ".csv"
        df = pd.read_csv(_file_)
        SUV_DATA.append(df)

    os.chdir('..')
    os.chdir('PickupTruck') # GETTING TRUCK DATA
    file_name = "Segment_Data_2020 - T - ALL.csv"

    _df_ = pd.read_csv(file_name)
    TRUCK_DATA.append(_df_)

    os.chdir('..')
    os.chdir('Minivan') # GETTING MINIVAN DATA
    file_name = "Segment_Data_2020 - M - Minivans.csv"

    _df_ = pd.read_csv(file_name)
    MINIVAN_DATA.append(_df_)
    # **************************************************************

    # print(MINIVAN_DATA)

    SEGMENT_2020_DATA = [PASSENGER_DATA, SUV_DATA, TRUCK_DATA, MINIVAN_DATA]
    del MINIVAN_DATA
    del TRUCK_DATA
    del SUV_DATA
    del PASSENGER_DATA
    del file_name
    del _df_

    #print(SEGMENT_2020_DATA)
    SEGMENT_DATA = [SEGMENT_2019_DATA, SEGMENT_2020_DATA]
    return MANUFACTURE_DATA, MODEL_YEARLY_DATA, YEARLY_CAR_SALES_DATA, QUARTERLY_BRAND_SALES_DATA, \
           QUARTERLY_MAN_SALES_DATA, DAILY_INFECTIONS, MONTHLY_UNEMPLOYMENT, SEGMENT_DATA
