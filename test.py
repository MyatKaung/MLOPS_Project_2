
from utils.helpers import *
from config.paths_config import *
from pipeline.prediction_pipeline import hybrid_recommendation



print(find_similar_animes('Fairy Tail', ANIME_WEIGHTS_PATH, ANIME2ANIME_ENCODED, ANIME2ANIME_DECODED, DF))

similar_users=find_similar_users(11880,USER_WEIGHTS_PATH,USER2USER_ENCODED,USER2USER_DECODED)
print("Similiar Ussers", similar_users)
pref = get_user_preferences(11880,RATING_DF,DF)
print(get_user_recommendations(similar_users,pref,DF,SYNOPSIS_DF,RATING_DF))

print(hybrid_recommendation(11880))
# At the top of test.py, add:
import numpy as np
import joblib
from config.paths_config import *

# Before calling hybrid_recommendation, add:
user_weights = joblib.load(USER_WEIGHTS_PATH)
anime_weights = joblib.load(ANIME_WEIGHTS_PATH)

print(f"User weights shape: {user_weights.shape}")
print(f"Anime weights shape: {anime_weights.shape}")

user2user = joblib.load(USER2USER_ENCODED)
anime2anime = joblib.load(ANIME2ANIME_ENCODED)

